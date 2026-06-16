package controller;
import dao.CatalogDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
@WebServlet("/sellCar")
public class SellCarServlet extends HttpServlet {
    private final CatalogDAO catalogDAO = new CatalogDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/requireLogin.jsp");
            return;
        }
        try {
            req.setAttribute("brands",     catalogDAO.getAllBrands());
            req.setAttribute("fuelTypes",  catalogDAO.getAllFuelTypes());
            req.setAttribute("wheelSizes", catalogDAO.getAllWheelSizes());
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.getRequestDispatcher("/sellCar.jsp").forward(req, resp);
    }
}