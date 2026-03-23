package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.CarSpecs;

public class CarSpecsDAO {
    private Connection getConnection() throws Exception {
        // nap driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        // tao lien ket den database
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/car_store", "root", "");
    }

    public CarSpecs getSpecsByCarId(int carId) throws Exception, SQLException {
        CarSpecs specs = null;
        String sql = "SELECT * FROM car_specs WHERE car_id = ?";
        try (Connection conn =getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, carId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                specs = new CarSpecs();
                specs.setId(rs.getInt("id"));
                specs.setCarId(rs.getInt("car_id"));
                specs.setSeatCount(rs.getInt("seat_count"));
                specs.setDimensions(rs.getString("dimensions"));
                specs.setWheelType(rs.getString("wheel_type"));
                specs.setWeight(rs.getInt("weight"));
                specs.setGroundClearance(rs.getInt("ground_clearance"));
                specs.setEngine(rs.getString("engine"));
                specs.setFuelType(rs.getString("fuel_type"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return specs;
    }
}
