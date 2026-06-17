package controller;

import dao.StatisticsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AdminDashboardServlet", value = "/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StatisticsDAO dao = new StatisticsDAO();

        int carCount = dao.getCarCount();
        int offerCount = dao.getOfferCount();
        int testDrivePendingCount = dao.getTestDrivePendingCount();

        request.setAttribute("carCount", carCount);
        request.setAttribute("offerCount", offerCount);
        request.setAttribute("testDrivePendingCount", testDrivePendingCount);

        request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
    }
}
