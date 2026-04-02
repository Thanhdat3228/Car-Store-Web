package controller;

import dao.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.UUID;

@WebServlet(name = "AdminAddCarsServlet", value = "/admin/addCar")
public class AdminAddCarsServlet extends HttpServlet {
    private static final String UPLOAD_DIR="image";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        int year=Integer.parseInt(request.getParameter("year"));
        int mileage =Integer.parseInt(request.getParameter("mileage"));
        int price=Integer.parseInt(request.getParameter("price"));
        String location=request.getParameter("location");
        String description=request.getParameter("description");

        //lấy dữ liệu trường image từ form dc gửi lên server
        Part imagePart=request.getPart("image");
        //lấy tên file gốc mà người dùng upload lên
        String originalFileName= Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
        //Chuyển file name về lowercase r kiểm tra xem phần đuôi có đúng định dạng chưa
        if(!originalFileName.toLowerCase().matches(".*\\.(jpg|png|jpeg|webp)$")){
            response.sendRedirect(request.getContextPath()+"/admin/cars?msg=error");
            return;
        }
        //luu phần mở rộng của file ảnh vào biến extension
        String extension= "";
        int i=originalFileName.lastIndexOf('.');
        if(i>0) extension=originalFileName.substring(i);

        //sinh ra chuỗi ngẫu nhiên duy nhất + với đuôi extension
        String imageName= UUID.randomUUID().toString()+extension;

        String uploadPath=getServletContext().getRealPath("")+ File.separator+UPLOAD_DIR;
        File uploadDir=new File(uploadPath);
        if(!uploadDir.exists()) uploadDir.mkdir();

        //lưu nội dung file upload vào uploadPath
        imagePart.write(uploadPath+ File.separator+imageName);
        //tạo đường dẫn tương đối lưu vào db
        String imagePath=UPLOAD_DIR+ "/" +imageName;

        Connection conn=null;
        try {
            conn=DBConnection.getConnection();
            conn.setAutoCommit(false);

            String sql="INSERRT INTO cars (brand, modal, year, mileage, price, location,description, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps=conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, brand);
            ps.setString(2, model);
            ps.setInt(3, year);
            ps.setInt(4, mileage);
            ps.setInt(5, price);
            ps.setString(6, location);
            ps.setString(7, description);
            ps.setString(8, imagePath);
            ps.executeUpdate();

            ResultSet rs=ps.getGeneratedKeys();
            int newCarId=0;
            if(rs.next()) newCarId =rs.getInt(1);

            int seatCount = Integer.parseInt(request.getParameter("seat_Count"));
            String dimensions = request.getParameter("dimensions");
            String wheelType = request.getParameter("wheels");
            int weight = Integer.parseInt(request.getParameter("weight").replaceAll("[^0-9]", ""));
            int groundClearance = Integer.parseInt(request.getParameter("ground_clearance"));
            String engine = request.getParameter("engine");
            String fuelType = request.getParameter("fuel_type");

            String sqlSpec = "INSERT INTO car_specs (car_id, seat_count, dimensions, wheel_type, weight, ground_clearance, engine, fuel_type) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement specStmt = conn.prepareStatement(sqlSpec);
            specStmt.setInt(1, newCarId);
            specStmt.setInt(2, seatCount);
            specStmt.setString(3, dimensions);
            specStmt.setString(4, wheelType);
            specStmt.setInt(5, weight);
            specStmt.setInt(6, groundClearance);
            specStmt.setString(7, engine);
            specStmt.setString(8, fuelType);
            specStmt.executeUpdate();

            conn.commit();
            conn.setAutoCommit(true);
            conn.close();

            response.sendRedirect(request.getContextPath()+ "/admin/cars?msg=addes");

        } catch (Exception e){
            e.printStackTrace();
            if(conn != null){
                try {
                    conn.rollback();
                    conn.setAutoCommit(true);
                    conn.close();
                }catch (Exception ex){
                    ex.printStackTrace();}
                }
            response.sendRedirect(request.getContextPath()+"/admin/cars?msg=error");
            }
        }
    }
