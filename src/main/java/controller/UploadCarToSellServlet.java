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
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class UploadCarToSellServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIR = "image"; // thư mục lưu ảnh trong webapp

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Lấy dữ liệu từ form (Bỏ qua id vì database sẽ tự sinh Auto_Increment)
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        int year = Integer.parseInt(request.getParameter("year"));
        int mileage = Integer.parseInt(request.getParameter("mileage"));
        int price = Integer.parseInt(request.getParameter("price"));
        String location = request.getParameter("location");
        String description = request.getParameter("description");

        // Xử lý file upload an toàn hơn
        Part imagePart = request.getPart("image");
        String originalFileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();

        // KIỂM TRA ĐỊNH DẠNG FILE (CHỈ CHO PHÉP ẢNH)
        if (!originalFileName.toLowerCase().matches(".*\\.(jpg|png|jpeg|webp)$")) {
            response.sendRedirect("error.jsp?msg=InvalidFileType");
            return;
        }

        // SINH TÊN FILE MỚI ĐỂ BẢO MẬT & TRÁNH TRÙNG LẶP
        String extension = "";
        int i = originalFileName.lastIndexOf('.');
        if (i > 0) {
            extension = originalFileName.substring(i);
        }
        String imageName = UUID.randomUUID().toString() + extension;

        // Đường dẫn tuyệt đối tới thư mục /image trong webapp
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Lưu file ảnh vào thư mục image
        imagePart.write(uploadPath + File.separator + imageName);

        // Đường dẫn ảnh để lưu vào DB (tương đối)
        String imagePath = UPLOAD_DIR + "/" + imageName;

        // Lưu dữ liệu vào database với Transaction
        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            // START TRANSACTION
            conn.setAutoCommit(false);

            // 1. Insert bảng cars (Không có cột ID ở đây)
            String sql = "INSERT INTO cars (brand, model, year, mileage, price, location, description, image) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            // Sử dụng RETURN_GENERATED_KEYS để yêu cầu DB trả về ID vừa tự động khởi tạo
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, brand);
            stmt.setString(2, model);
            stmt.setInt(3, year);
            stmt.setInt(4, mileage);
            stmt.setInt(5, price);
            stmt.setString(6, location);
            stmt.setString(7, description);
            stmt.setString(8, imagePath);
            stmt.executeUpdate();

            // LẤY ID TỰ ĐỘNG SINH CỦA XE VỪA INSERT
            ResultSet rsKeys = stmt.getGeneratedKeys();
            int newCarId = 0;
            if (rsKeys.next()) {
                newCarId = rsKeys.getInt(1);
            } else {
                throw new Exception("Lỗi: Không thể lấy được ID xe mới tạo.");
            }

            // 2. Lấy dữ liệu thông số kỹ thuật từ form
            int seat_Count = Integer.parseInt(request.getParameter("seat_Count"));
            String dimensions = request.getParameter("dimensions");
            String wheelType = request.getParameter("wheels");
            String weight = request.getParameter("weight");
            int ground_clearance = Integer.parseInt(request.getParameter("ground_clearance"));
            String engine = request.getParameter("engine");
            String fuelType = request.getParameter("fuel_type");

            // 3. Insert vào bảng car_specs (Dùng newCarId lấy ở trên nối sang)
            String sqlSpec = "INSERT INTO car_specs (car_id, seat_count, dimensions, wheel_type, weight, ground_clearance, engine, fuel_type) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement specStmt = conn.prepareStatement(sqlSpec);
            specStmt.setInt(1, newCarId);
            specStmt.setInt(2, seat_Count);
            specStmt.setString(3, dimensions);
            specStmt.setString(4, wheelType);
            specStmt.setString(5, weight);
            specStmt.setInt(6, ground_clearance);
            specStmt.setString(7, engine);
            specStmt.setString(8, fuelType);
            specStmt.executeUpdate();

            // XÁC NHẬN LƯU THAY ĐỔI
            conn.commit();
            conn.setAutoCommit(true); // Trả lại trạng thái cũ
            conn.close();

            response.sendRedirect("success.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            // HỦY BỎ GIAO DỊCH NẾU CÓ LỖI XẢY RA (TRÁNH CƠ SỞ DỮ LIỆU CHỈ LƯU ĐƯỢC 1 BẢNG)
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
    }
}