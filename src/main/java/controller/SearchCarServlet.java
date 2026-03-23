package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

import dao.CarDAO;
import model.Car;

@WebServlet(name = "SearchCarServlet", value = "/SearchCarServlet")
public class SearchCarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        CarDAO dao = new CarDAO();

        List<Car> result;
        if (keyword != null && !keyword.trim().isEmpty()) {
            result = dao.searchByName(keyword.trim());
        } else {
            result = dao.getAllCars();
        }
        System.out.println("Keyword: " + keyword);
        System.out.println("Số xe tìm thấy: " + result.size());

        request.setAttribute("carList", result);
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}