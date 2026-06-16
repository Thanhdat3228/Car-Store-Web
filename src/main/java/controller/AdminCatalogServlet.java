package controller;

import dao.CatalogDAO;
import model.CarBrand;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/catalog")
public class AdminCatalogServlet extends HttpServlet {

    private final CatalogDAO catalogDAO = new CatalogDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            req.setAttribute("brands",     catalogDAO.getAllBrands());
            req.setAttribute("allModels",  catalogDAO.getAllModels());
            req.setAttribute("fuelTypes",  catalogDAO.getAllFuelTypesWithId());
            req.setAttribute("wheelSizes", catalogDAO.getAllWheelSizesWithId());
            req.getRequestDispatcher("/admin/catalog.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        String redirectUrl = req.getContextPath() + "/admin/catalog";

        try {
            switch (action == null ? "" : action) {

                // ── Hãng xe ──
                case "addBrand": {
                    String name = req.getParameter("brandName");
                    if (name != null && !name.isBlank()) catalogDAO.addBrand(name);
                    break;
                }
                case "deleteBrand": {
                    int id = Integer.parseInt(req.getParameter("brandId"));
                    catalogDAO.deleteBrand(id);
                    break;
                }

                // ── Dòng xe ──
                case "addModel": {
                    int brandId = Integer.parseInt(req.getParameter("brandId"));
                    String modelName = req.getParameter("modelName");
                    if (modelName != null && !modelName.isBlank())
                        catalogDAO.addModel(brandId, modelName);
                    break;
                }
                case "deleteModel": {
                    int id = Integer.parseInt(req.getParameter("modelId"));
                    catalogDAO.deleteModel(id);
                    break;
                }

                // ── Nhiên liệu ──
                case "addFuel": {
                    String name = req.getParameter("fuelName");
                    if (name != null && !name.isBlank()) catalogDAO.addFuelType(name);
                    break;
                }
                case "deleteFuel": {
                    int id = Integer.parseInt(req.getParameter("fuelId"));
                    catalogDAO.deleteFuelType(id);
                    break;
                }

                // ── La-zăng ──
                case "addWheel": {
                    String label = req.getParameter("wheelLabel");
                    if (label != null && !label.isBlank()) catalogDAO.addWheelSize(label);
                    break;
                }
                case "deleteWheel": {
                    int id = Integer.parseInt(req.getParameter("wheelId"));
                    catalogDAO.deleteWheelSize(id);
                    break;
                }

                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        resp.sendRedirect(redirectUrl + "?msg=success");
    }
}