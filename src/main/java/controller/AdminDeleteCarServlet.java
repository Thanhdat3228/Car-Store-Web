package controller;

import dao.CarDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AdminDeleteCarServlet", value = "/admin/deleteCar")
public class AdminDeleteCarServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam=request.getParameter("id");
        if(idParam!=null && !idParam.isEmpty()){
            try{
            int id=Integer.parseInt(idParam);
            CarDAO carDAO=new CarDAO();
            carDAO.deleteCar(id);
            } catch(NumberFormatException e){
                e.printStackTrace();
            }
        }
        response.sendRedirect(request.getContextPath()+ "/admin/cars?msg=deleted");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}