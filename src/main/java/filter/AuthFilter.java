package filter;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
@WebFilter("/sellCar.html")
@WebServlet(name = "AuthFilter", value = "/AuthFilter")
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        // Kiểm tra xem đã đăng nhập chưa
        if (session != null && session.getAttribute("user") != null) {
            chain.doFilter(request, response); // Cho phép đi tiếp
        } else {
            // Nếu chưa đăng nhập thì chuyển hướng về login.jsp
            res.sendRedirect(req.getContextPath() + "/requireLogin.jsp");
        }
    }

}