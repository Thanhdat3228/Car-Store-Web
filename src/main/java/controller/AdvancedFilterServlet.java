package controller;

import dao.CarDAO;
import model.Car;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdvancedFilterServlet")
public class AdvancedFilterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // lấy dữ liệu từ form
        String brand = request.getParameter("brand");
        String year = request.getParameter("year");
        String price = request.getParameter("price");

        // gọi DAO
        CarDAO dao = new CarDAO();

        List<Car> filteredList =
                dao.filterCars(brand, year, price);

        // gửi dữ liệu sang jsp
        request.setAttribute("carList", filteredList);

        request.getRequestDispatcher("index.jsp")
                .forward(request, response);
    }
}