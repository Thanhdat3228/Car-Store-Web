package controller;
import dao.TestDriveDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
@WebServlet("/admin/test-drives")
public class AdminTestDriveServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        TestDriveDAO dao =
                new TestDriveDAO();

        request.setAttribute(
                "testDrives",
                dao.getAllRequests());

        request.getRequestDispatcher(
                        "/admin/test-drive-list.jsp")
                .forward(request, response);
    }
}