package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Car;

public class CarDAO {

    public Car getCarById(int id) {
        Car car = null;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM cars WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                car = new Car();
                car.setId(rs.getInt("id"));
                car.setBrand(rs.getString("brand"));
                car.setModel(rs.getString("model"));
                car.setYear(rs.getInt("year"));
                car.setMileage(rs.getInt("mileage")); // Sử dụng cột 'km' trong database
                car.setPrice(rs.getDouble("price"));
                car.setLocation(rs.getString("location"));
                car.setDescription(rs.getString("description"));
                car.setImage(rs.getString("image"));
            }
            conn.close();
            ps.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return car;
    }

    public List<Car> searchCars(String keyword, String location) {
        List<Car> list = new ArrayList<>();

        String sql = "SELECT * FROM cars WHERE 1=1 ";

        if (keyword != null && !keyword.trim().isEmpty()) {
            sql += "AND (brand LIKE ? OR model LIKE ?) ";
        }

        if (location != null && !location.trim().isEmpty()) {
            sql += "AND location = ? ";
        }

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            int index = 1;

            if (keyword != null && !keyword.trim().isEmpty()) {
                ps.setString(index++, "%" + keyword + "%");
                ps.setString(index++, "%" + keyword + "%");
            }

            if (location != null && !location.trim().isEmpty()) {
                ps.setString(index++, location);
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Car car = new Car();
                car.setId(rs.getInt("id"));
                car.setBrand(rs.getString("brand"));
                car.setModel(rs.getString("model"));
                car.setYear(rs.getInt("year"));
                car.setMileage(rs.getInt("mileage"));
                car.setPrice(rs.getDouble("price"));
                car.setLocation(rs.getString("location"));
                car.setImage(rs.getString("image"));

                list.add(car);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Car> getCarsSortedByPriceAsc() {
        String sql = "SELECT * FROM cars ORDER BY price ASC";
        return getCarsByQuery(sql);
    }

    public List<Car> getCarsSortedByPriceDesc() {
        String sql = "SELECT * FROM cars ORDER BY price DESC";
        return getCarsByQuery(sql);
    }

    private List<Car> getCarsByQuery(String sql) {
        List<Car> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Car car = new Car();
                car.setId(rs.getInt("id"));
                car.setBrand(rs.getString("brand"));
                car.setModel(rs.getString("model"));
                car.setYear(rs.getInt("year"));
                car.setMileage(rs.getInt("mileage"));
                car.setPrice(rs.getDouble("price"));
                car.setLocation(rs.getString("location"));
                car.setImage(rs.getString("image"));

                list.add(car);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }

    public List<Car> getAllCars() {
        String sql = "SELECT * FROM cars";
        return getCarsByQuery(sql);
    }

    public List<Car> searchByName(String keyword) {
        List<Car> list = new ArrayList<>();
        String sql = "SELECT * FROM cars WHERE CONCAT(brand, ' ', model) LIKE ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Car car = new Car();
                car.setId(rs.getInt("id"));
                car.setBrand(rs.getString("brand"));
                car.setModel(rs.getString("model"));
                car.setYear(rs.getInt("year"));
                car.setMileage(rs.getInt("mileage"));
                car.setPrice(rs.getDouble("price"));
                car.setLocation(rs.getString("location"));
                car.setImage(rs.getString("image"));
                car.setDescription(rs.getString("description"));
                list.add(car);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public boolean deleteCar(int id) {
        String sql = "DELETE FROM cars WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            int row = ps.executeUpdate();
            return row > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean updateCar(Car car){
        String sql;
        if(car.getImage()!=null && !car.getImage().isEmpty()){
            sql="UPDATE cars SET brand=?, modal=?, year=?, mileage=?, price=?, location=?, description=?, image=? WHERE id=?";
        }else{
            sql = "UPDATE cars SET brand=?, model=?, year=?, mileage=?, price=?, location=?, description=? WHERE id=?";
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, car.getBrand());
            ps.setString(2, car.getModel());
            ps.setInt(3, car.getYear());
            ps.setInt(4, car.getMileage());
            ps.setDouble(5, car.getPrice());
            ps.setString(6, car.getLocation());
            ps.setString(7, car.getDescription());

//            xu ly truong hop ko co anh
            if(car.getImage()!=null && !car.getImage().isEmpty()){
                ps.setString(8, car.getImage());
                ps.setInt(9, car.getId());
            }else {
                ps.setInt(8,car.getId());
            }
            int row=ps.executeUpdate();
            return row>0;
        } catch (Exception e){
            e.printStackTrace();
        }
        return false;

    }
}