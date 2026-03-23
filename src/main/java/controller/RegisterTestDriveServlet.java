package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import dao.DBConnection;

@WebServlet(name = "RegisterTestDrive", value = "/RegisterTestDrive")
public class RegisterTestDriveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterTestDriveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String carId = request.getParameter("carId");
        if (carId == null || carId.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/home.jsp");
            return;
        }

        String carName = request.getParameter("carName");
        String fullName = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String testDate = request.getParameter("date");
        String testTime = request.getParameter("time");

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "INSERT INTO test_drive_registration "
                    + "(car_id, car_name, full_name, phone, test_date, test_time) "
                    + "VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(carId));
            ps.setString(2, carName);
            ps.setString(3, fullName);
            ps.setString(4, phone);
            ps.setDate(5, java.sql.Date.valueOf(testDate));
            ps.setTime(6, java.sql.Time.valueOf(testTime + ":00"));

            ps.executeUpdate();

            response.sendRedirect(request.getContextPath() + "/testDriveSuccess.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(
                    request.getContextPath() + "/testDrive.jsp?error=true&carId=" + carId);
        }
    }
}
