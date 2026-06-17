package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StatisticsDAO {

    public int getCarCount() {
        return getCount("SELECT COUNT(*) FROM cars");
    }

    public int getOfferCount() {
        return getCount("SELECT COUNT(*) FROM offers");
    }

    public int getTestDrivePendingCount() {
        return getCount("SELECT COUNT(*) FROM test_drive_registration WHERE status = 'PENDING'");
    }

    private int getCount(String sql) {
        int count = 0;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}
