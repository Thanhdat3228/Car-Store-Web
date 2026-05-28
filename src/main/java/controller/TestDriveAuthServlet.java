package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.net.URLEncoder;

@WebServlet(name = "TestDriveAuthServlet", value = "/TestDriveAuthServlet")
public class TestDriveAuthServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String carId = request.getParameter("carId");
        if (carId == null || carId.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/home.jsp");
            return;
        }

        String targetUrl = request.getContextPath() + "/testDrive.jsp?carId="
                + URLEncoder.encode(carId, "UTF-8");

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(targetUrl);
            return;
        }

        session = request.getSession();
        session.setAttribute("redirectAfterLogin", targetUrl);
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
}
