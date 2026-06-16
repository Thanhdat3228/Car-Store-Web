package controller;

import dao.CatalogDAO;
import model.CarModelCatalog;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/api/models")
public class CatalogApiServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("application/json;charset=UTF-8");
        String brandIdStr = req.getParameter("brandId");

        if (brandIdStr == null || brandIdStr.isBlank()) {
            resp.getWriter().write("[]");
            return;
        }

        try {
            int brandId = Integer.parseInt(brandIdStr);
            List<CarModelCatalog> models = new CatalogDAO().getModelsByBrand(brandId);

            StringBuilder json = new StringBuilder("[");
            for (int i = 0; i < models.size(); i++) {
                CarModelCatalog m = models.get(i);
                json.append("{\"id\":").append(m.getId())
                        .append(",\"modelName\":\"").append(escapeJson(m.getModelName())).append("\"}");
                if (i < models.size() - 1) json.append(",");
            }
            json.append("]");

            resp.getWriter().write(json.toString());

        } catch (NumberFormatException e) {
            resp.setStatus(400);
            resp.getWriter().write("[]");
        } catch (Exception e) {
            e.printStackTrace();
            resp.setStatus(500);
            resp.getWriter().write("[]");
        }
    }

    private String escapeJson(String s) {
        if (s == null) return "";
        return s.replace("\\", "\\\\").replace("\"", "\\\"");
    }
}