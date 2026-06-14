package controller;
import dao.TestDriveDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
@WebServlet("/admin/approve-test-drive")
public class ApproveTestDriveServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        int id =
                Integer.parseInt(
                        request.getParameter("id"));

        new TestDriveDAO()
                .approveRequest(id);

        response.sendRedirect(
                request.getContextPath()
                        + "/admin/test-drives");
    }
}