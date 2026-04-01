package controller;

import dao.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "MakeOfferServlet", value = "/MakeOfferServlet")
public class MakeOfferServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName=request.getParameter("firstName");
        String lastName=request.getParameter("lastName");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String message=request.getParameter("message");
        String price=request.getParameter("price");

        try {
            Connection conn= DBConnection.getConnection();

            String sql="INSERT INTO offers(first_name,last_name, email, phone, message, price) VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, email);
            ps.setString(4,phone);
            ps.setString(5,message);
            ps.setDouble(6, Double.parseDouble(price));

            ps.executeUpdate();
            conn.close();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect("success.jsp");
    }
}