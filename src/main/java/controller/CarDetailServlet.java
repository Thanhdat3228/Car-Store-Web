package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import dao.CarDAO;
import dao.CarSpecsDAO;
import dao.CarImageDAO;
import model.Car;
import model.CarSpecs;
import java.util.List;

@WebServlet(name = "CarDetailServlet", value = "/CarDetailServlet")
public class CarDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Lấy id từ parameter
            String idParam = request.getParameter("id");
            if (idParam == null || idParam.isEmpty()) {
                System.out.println("CarDetailServlet: missing id param");
                response.sendRedirect("home.jsp");
                return;
            }

            int id = Integer.parseInt(idParam);
            System.out.println("CarDetailServlet: id=" + id);
            CarDAO dao = new CarDAO();
            Car car = dao.getCarById(id);
            System.out.println("CarDetailServlet: car=" + car);

            // Kiểm tra nếu không tìm thấy xe
            if (car == null) {
                System.out.println("CarDetailServlet: car not found for id=" + id);
                response.sendRedirect("home.jsp?error=notfound");
                return;
            }
            CarSpecsDAO specsDao = new CarSpecsDAO();
            CarSpecs specs = specsDao.getSpecsByCarId(id);

            // Lấy danh sách ảnh gallery từ bảng car_images
            CarImageDAO imageDao = new CarImageDAO();
            List<String> imageList = imageDao.getImagesByCarId(id);
            // Nếu chưa có ảnh phụ, dùng ảnh chính của xe làm fallback
            if (imageList.isEmpty() && car.getImage() != null && !car.getImage().isEmpty()) {
                imageList.add(car.getImage());
            }

            request.setAttribute("car", car);
            request.setAttribute("specs", specs);
            request.setAttribute("imageList", imageList);
            RequestDispatcher rd = request.getRequestDispatcher("car_detail.jsp");
            rd.forward(request, response);

        } catch (NumberFormatException e) {
            // ID không hợp lệ
            e.printStackTrace();
            response.sendRedirect("home.jsp?error=invalid");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home.jsp?error=server");
        }
    }
}