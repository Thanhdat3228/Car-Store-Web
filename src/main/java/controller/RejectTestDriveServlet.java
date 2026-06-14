package controller;
import dao.TestDriveDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
@WebServlet("/admin/reject-test-drive")
public class RejectTestDriveServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        int id =
                Integer.parseInt(
                        request.getParameter("id"));

        new TestDriveDAO()
                .rejectRequest(id);

        response.sendRedirect(
                request.getContextPath()
                        + "/admin/test-drives");
    }
}
