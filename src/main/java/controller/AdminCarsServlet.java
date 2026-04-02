package controller;

import dao.CarDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Car;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminCarsServlet", value = "/admin/cars")
public class AdminCarsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CarDAO carDAO=new CarDAO();
        List<Car> listCars=carDAO.getAllCars();
        request.setAttribute("listCars", listCars);
        request.getRequestDispatcher("/admin/cars.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}