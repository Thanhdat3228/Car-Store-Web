package controller;
import dao.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.UUID;
@WebServlet(name = "UploadCarToSellServlet", value = "/UploadCarToSellServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
        maxFileSize       = 1024 * 1024 * 10,  // 10MB
        maxRequestSize    = 1024 * 1024 * 50   // 50MB
)
public class UploadCarToSellServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "image";
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        // ── Thông tin cơ bản ──────────────────────────────────────
        String brand       = request.getParameter("brand");
        String model       = request.getParameter("model");
        String location    = request.getParameter("location");
        String description = request.getParameter("description");
        // ── Validation & parse các trường số ─────────────────────
        int year, mileage;
        long price;
        int seatCount, weight, groundClearance;
        try {
            year = Integer.parseInt(request.getParameter("year"));
            if (year < 1990 || year > 2026) {
                response.sendRedirect("error.jsp?msg=InvalidYear");
                return;
            }
            mileage = Integer.parseInt(request.getParameter("mileage"));
            if (mileage < 0 || mileage > 1_000_000) {
                response.sendRedirect("error.jsp?msg=InvalidMileage");
                return;
            }
            price = Long.parseLong(request.getParameter("price"));
            if (price < 10_000_000 || price > 50_000_000_000L) {
                response.sendRedirect("error.jsp?msg=InvalidPrice");
                return;
            }
            seatCount = Integer.parseInt(request.getParameter("seat_Count"));
            // Dimensions: ghép từ 3 trường riêng
            int dimLength = Integer.parseInt(request.getParameter("dim_length"));
            int dimWidth  = Integer.parseInt(request.getParameter("dim_width"));
            int dimHeight = Integer.parseInt(request.getParameter("dim_height"));
            if (dimLength < 2000 || dimLength > 7000
                    || dimWidth  < 1200 || dimWidth  > 3000
                    || dimHeight < 1000 || dimHeight > 2500) {
                response.sendRedirect("error.jsp?msg=InvalidDimensions");
                return;
            }
            String dimensions = dimLength + " x " + dimWidth + " x " + dimHeight + " mm";
            weight = Integer.parseInt(request.getParameter("weight"));
            if (weight < 800 || weight > 4000) {
                response.sendRedirect("error.jsp?msg=InvalidWeight");
                return;
            }
            groundClearance = Integer.parseInt(request.getParameter("ground_clearance"));
            if (groundClearance < 100 || groundClearance > 350) {
                response.sendRedirect("error.jsp?msg=InvalidGroundClearance");
                return;
            }
            String wheelType = request.getParameter("wheels");
            String engine    = request.getParameter("engine");
            String fuelType  = request.getParameter("fuel_type");
            // ── Xử lý ảnh ─────────────────────────────────────────
            Part imagePart = request.getPart("image");
            String originalFileName = Paths.get(imagePart.getSubmittedFileName())
                    .getFileName().toString();
            if (!originalFileName.toLowerCase().matches(".*\\.(jpg|png|jpeg|webp)$")) {
                response.sendRedirect("error.jsp?msg=InvalidFileType");
                return;
            }
            String extension = "";
            int dotIdx = originalFileName.lastIndexOf('.');
            if (dotIdx > 0) extension = originalFileName.substring(dotIdx);
            String imageName = UUID.randomUUID().toString() + extension;
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();
            imagePart.write(uploadPath + File.separator + imageName);
            String imagePath = UPLOAD_DIR + "/" + imageName;
            // ── Lưu vào database (Transaction) ────────────────────
            Connection conn = null;
            try {
                conn = DBConnection.getConnection();
                conn.setAutoCommit(false);
                // 1. Insert bảng cars
                String sql = "INSERT INTO cars (brand, model, year, mileage, price, location, description, image) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                stmt.setString(1, brand);
                stmt.setString(2, model);
                stmt.setInt(3, year);
                stmt.setInt(4, mileage);
                stmt.setLong(5, price);
                stmt.setString(6, location);
                stmt.setString(7, description);
                stmt.setString(8, imagePath);
                stmt.executeUpdate();
                // Lấy ID xe vừa tạo
                ResultSet rsKeys = stmt.getGeneratedKeys();
                int newCarId = 0;
                if (rsKeys.next()) {
                    newCarId = rsKeys.getInt(1);
                } else {
                    throw new Exception("Không thể lấy ID xe mới tạo.");
                }
                // 2. Insert bảng car_specs
                String sqlSpec = "INSERT INTO car_specs "
                        + "(car_id, seat_count, dimensions, wheel_type, weight, ground_clearance, engine, fuel_type) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement specStmt = conn.prepareStatement(sqlSpec);
                specStmt.setInt(1, newCarId);
                specStmt.setInt(2, seatCount);
                specStmt.setString(3, dimensions);
                specStmt.setString(4, wheelType);
                specStmt.setInt(5, weight);          // FIX: setInt thay vì setString
                specStmt.setInt(6, groundClearance);
                specStmt.setString(7, engine);
                specStmt.setString(8, fuelType);
                specStmt.executeUpdate();
                conn.commit();
                conn.setAutoCommit(true);
                conn.close();
                response.sendRedirect("success.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                if (conn != null) {
                    try {
                        conn.rollback();
                        conn.setAutoCommit(true);
                        conn.close();
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }
                response.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?msg=InvalidNumber");
        }
    }
}