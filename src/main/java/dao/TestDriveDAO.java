package dao;
import model.TestDrive;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TestDriveDAO {
    public List<TestDrive> getAllRequests() {
        List<TestDrive> list = new ArrayList<>();
        String sql = "SELECT * FROM test_drive_registration ORDER BY created_at DESC";
        try (
                Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                TestDrive t = new TestDrive();

                t.setId(rs.getInt("id"));
                t.setCarId(rs.getInt("car_id"));
                t.setCarName(rs.getString("car_name"));
                t.setFullName(rs.getString("full_name"));
                t.setPhone(rs.getString("phone"));
                t.setTestDate(rs.getDate("test_date"));
                t.setTestTime(rs.getTime("test_time"));
                t.setStatus(rs.getString("status"));
                t.setCreatedAt(rs.getTimestamp("created_at"));

                list.add(t);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean approveRequest(int id) {
        String sql = "UPDATE test_drive_registration " + "SET status='APPROVED' " + "WHERE id=?";
        try (
                Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean rejectRequest(int id) {
        String sql = "UPDATE test_drive_registration " + "SET status='REJECTED' " + "WHERE id=?";
        try (
                Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<TestDrive> getApprovedRequests() {
        List<TestDrive> list = new ArrayList<>();
        String sql = "SELECT * FROM test_drive_registration " + "WHERE status='APPROVED' " + "ORDER BY test_date ASC";
        try (
                Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                TestDrive t = new TestDrive();

                t.setId(rs.getInt("id"));
                t.setCarName(rs.getString("car_name"));
                t.setFullName(rs.getString("full_name"));
                t.setPhone(rs.getString("phone"));
                t.setTestDate(rs.getDate("test_date"));
                t.setTestTime(rs.getTime("test_time"));

                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<TestDrive> getByUsername(String username) {
        List<TestDrive> list = new ArrayList<>();
        String sql = "SELECT * " + "FROM test_drive_registration " + "WHERE username=? " + "ORDER BY created_at DESC";
        try (
                Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TestDrive t = new TestDrive();

                t.setId(rs.getInt("id"));
                t.setCarId(rs.getInt("car_id"));
                t.setCarName(rs.getString("car_name"));
                t.setFullName(rs.getString("full_name"));
                t.setPhone(rs.getString("phone"));
                t.setTestDate(rs.getDate("test_date"));
                t.setTestTime(rs.getTime("test_time"));
                t.setStatus(rs.getString("status"));
                t.setCreatedAt(rs.getTimestamp("created_at"));

                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}

