package controller;


import dao.CarDAO;
import dao.CarSpecsDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Car;
import model.CarSpecs;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CarListServlet", value = "/CarListServlet")
public class CarListServlet extends HttpServlet {
    private CarDAO carDAO = new CarDAO();
    private CarSpecsDAO carSpecsDAO = new CarSpecsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy danh sách xe
            List<Car> carList = carDAO.getAllCars();

            // Với mỗi xe, lấy thêm specs từ CarSpecsDAO
            for (Car car : carList) {
                CarSpecs specs = carSpecsDAO.getSpecsByCarId(car.getId());
                car.setSpecs(specs); // gắn spec vào car
            }

            // Đưa list vào request
            request.setAttribute("carList", carList);
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home.jsp?error=server");
        }
    }
}

