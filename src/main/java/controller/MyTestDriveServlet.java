package controller;
import dao.TestDriveDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
@WebServlet("/MyTestDriveServlet")
public class MyTestDriveServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null){
            response.sendRedirect("login.jsp");
            return;
        }

        String username =
                (String) session.getAttribute("user");

        TestDriveDAO dao = new TestDriveDAO();

        request.setAttribute(
                "myTestDrives",
                dao.getByUsername(username));

        request.getRequestDispatcher("myTestDrive.jsp")
                .forward(request,response);
    }
}