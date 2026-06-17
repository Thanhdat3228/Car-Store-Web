package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Offer;

public class OfferDAO {
    public List<Offer> getAllOffers() {
        List<Offer> offers = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM offers");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Offer offer = new Offer();
                offer.setFirstName(rs.getString("first_name"));
                offer.setLastName(rs.getString("last_name"));
                offer.setEmail(rs.getString("email"));
                offer.setPhone(rs.getString("phone"));
                offer.setMessage(rs.getString("message"));
                offer.setPrice(rs.getDouble("price"));
                offers.add(offer);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return offers;
    }
}
