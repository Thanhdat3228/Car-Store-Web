package dao;
import model.CarBrand;
import model.CarModelCatalog;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class CatalogDAO {
    // ── Hãng xe ──────────────────────────────────────────
    public List<CarBrand> getAllBrands() throws Exception {
        List<CarBrand> list = new ArrayList<>();
        String sql = "SELECT id, name FROM car_brands ORDER BY name";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next())
                list.add(new CarBrand(rs.getInt("id"), rs.getString("name")));
        }
        return list;
    }
    public void addBrand(String name) throws Exception {
        String sql = "INSERT INTO car_brands (name) VALUES (?)";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, name.trim());
            ps.executeUpdate();
        }
    }
    public void deleteBrand(int id) throws Exception {
        String sql = "DELETE FROM car_brands WHERE id = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
    // ── Dòng xe ──────────────────────────────────────────
    public List<CarModelCatalog> getModelsByBrand(int brandId) throws Exception {
        List<CarModelCatalog> list = new ArrayList<>();
        String sql = "SELECT id, brand_id, model_name FROM car_models_catalog "
                + "WHERE brand_id = ? ORDER BY model_name";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, brandId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next())
                    list.add(new CarModelCatalog(
                            rs.getInt("id"),
                            rs.getInt("brand_id"),
                            rs.getString("model_name")
                    ));
            }
        }
        return list;
    }
    public List<CarModelCatalog> getAllModels() throws Exception {
        List<CarModelCatalog> list = new ArrayList<>();
        String sql = "SELECT id, brand_id, model_name FROM car_models_catalog ORDER BY model_name";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next())
                list.add(new CarModelCatalog(
                        rs.getInt("id"),
                        rs.getInt("brand_id"),
                        rs.getString("model_name")
                ));
        }
        return list;
    }
    public void addModel(int brandId, String modelName) throws Exception {
        String sql = "INSERT INTO car_models_catalog (brand_id, model_name) VALUES (?, ?)";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, brandId);
            ps.setString(2, modelName.trim());
            ps.executeUpdate();
        }
    }
    public void deleteModel(int id) throws Exception {
        String sql = "DELETE FROM car_models_catalog WHERE id = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
    // ── Nhiên liệu ───────────────────────────────────────
    public List<String> getAllFuelTypes() throws Exception {
        List<String> list = new ArrayList<>();
        String sql = "SELECT name FROM fuel_types ORDER BY id";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) list.add(rs.getString("name"));
        }
        return list;
    }
    public void addFuelType(String name) throws Exception {
        String sql = "INSERT INTO fuel_types (name) VALUES (?)";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, name.trim());
            ps.executeUpdate();
        }
    }
    public void deleteFuelType(int id) throws Exception {
        String sql = "DELETE FROM fuel_types WHERE id = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
    public List<String[]> getAllFuelTypesWithId() throws Exception {
        List<String[]> list = new ArrayList<>();
        String sql = "SELECT id, name FROM fuel_types ORDER BY id";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next())
                list.add(new String[]{
                        String.valueOf(rs.getInt("id")),
                        rs.getString("name")
                });
        }
        return list;
    }
    // ── La-zăng ──────────────────────────────────────────
    public List<String> getAllWheelSizes() throws Exception {
        List<String> list = new ArrayList<>();
        String sql = "SELECT size_label FROM wheel_sizes ORDER BY id";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) list.add(rs.getString("size_label"));
        }
        return list;
    }
    public void addWheelSize(String label) throws Exception {
        String sql = "INSERT INTO wheel_sizes (size_label) VALUES (?)";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, label.trim());
            ps.executeUpdate();
        }
    }
    public void deleteWheelSize(int id) throws Exception {
        String sql = "DELETE FROM wheel_sizes WHERE id = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
    public List<String[]> getAllWheelSizesWithId() throws Exception {
        List<String[]> list = new ArrayList<>();
        String sql = "SELECT id, size_label FROM wheel_sizes ORDER BY id";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next())
                list.add(new String[]{
                        String.valueOf(rs.getInt("id")),
                        rs.getString("size_label")
                });
        }
        return list;
    }
}