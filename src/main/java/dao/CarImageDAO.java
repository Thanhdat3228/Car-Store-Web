package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CarImageDAO {

    /**
     * Lấy danh sách tất cả đường dẫn ảnh của một chiếc xe.
     * Nếu bảng car_images chưa có dữ liệu cho xe này,
     * trả về list rỗng (JSP sẽ fallback về ảnh chính của xe).
     */
    public List<String> getImagesByCarId(int carId) {
        List<String> images = new ArrayList<>();
        String sql = "SELECT image_path FROM car_images WHERE car_id = ? ORDER BY sort_order ASC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, carId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                images.add(rs.getString("image_path"));
            }
        } catch (Exception e) {
            // Bảng car_images chưa tồn tại hoặc lỗi khác — trả list rỗng
            e.printStackTrace();
        }
        return images;
    }

    /**
     * Thêm một ảnh mới cho xe.
     */
    public boolean addImage(int carId, String imagePath, int sortOrder) {
        String sql = "INSERT INTO car_images (car_id, image_path, sort_order) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, carId);
            ps.setString(2, imagePath);
            ps.setInt(3, sortOrder);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Xóa tất cả ảnh của một xe (dùng khi admin cập nhật ảnh).
     */
    public boolean deleteAllImagesByCarId(int carId) {
        String sql = "DELETE FROM car_images WHERE car_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, carId);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
