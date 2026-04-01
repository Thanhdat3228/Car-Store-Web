package filter;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebFilter("/sellCar.html")
@WebServlet(name = "RoleFilter", value = "/RoleFilter")
public class RoleFilter implements Filter{

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req=(HttpServletRequest) request;
        HttpServletResponse res=(HttpServletResponse) response;
        HttpSession session=req.getSession(false);

        String role = (session != null) ? (String) session.getAttribute("role") : null;
        System.out.println("Role trong session: " + role);

        if("admin".equals(role)) {
            chain.doFilter(request, response);
        }else {
            res.sendRedirect(req.getContextPath() + "/access-denied.jsp"); // Từ chối nếu không phải admin

        }
    }


}