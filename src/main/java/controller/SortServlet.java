package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

import dao.CarDAO;
import model.Car;

@WebServlet(name = "SortServlet", value = "/SortServlet")
public class SortServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SortServlet() {
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sort=request.getParameter("sort");
        CarDAO carDAO=new CarDAO();
        List<Car> carList;

        if("lowToHigh".equals(sort)) {
            carList=carDAO.getCarsSortedByPriceAsc();
        }else if("highToLow".equals(sort)) {
            carList=carDAO.getCarsSortedByPriceDesc();
        }else {
            carList=carDAO.getAllCars();
        }
        request.setAttribute("carList", carList);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
