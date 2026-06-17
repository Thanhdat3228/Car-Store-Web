package controller;

import dao.OfferDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Offer;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminOfferServlet", value = "/admin/offers")
public class AdminOfferServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OfferDAO dao = new OfferDAO();
        List<Offer> offers = dao.getAllOffers();
        request.setAttribute("offers", offers);
        request.getRequestDispatcher("admin_offers.jsp").forward(request, response);
    }
}
