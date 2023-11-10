/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import models.Category;
import models.Product;

/**
 *
 * @author Admin
 */
public class FilterProductsController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FilterProductsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterProductsController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO cDAO = new CategoryDAO();
        ArrayList<Category> listCategories = cDAO.getAllCategories();
        request.setAttribute("listCategories", listCategories);

        String filterQuery = "Select * from Product where ";
        String rating = request.getParameter("rating") != null ? request.getParameter("rating") : "";
        String minPrice = request.getParameter("minPrice") != null ? request.getParameter("minPrice") : "";
        String maxPrice = request.getParameter("maxPrice") != null ? request.getParameter("maxPrice") : "";

        if (!rating.isEmpty()) {
            filterQuery += "rating = " + Integer.parseInt(rating);
            if (!minPrice.isEmpty()) {
                filterQuery += "And price >= " + Double.parseDouble(minPrice);
            }
            if (!maxPrice.isEmpty()) {
                filterQuery += "And price <= " + Double.parseDouble(maxPrice);
            }
        } else {
            if (!minPrice.isEmpty()) {
                filterQuery += "price >= " + Double.parseDouble(minPrice);
                if (!maxPrice.isEmpty()) {
                    filterQuery += "And price <= " + Double.parseDouble(maxPrice);
                }
            } else {
                filterQuery += "price <= " + Double.parseDouble(maxPrice);
                if (!minPrice.isEmpty()) {
                    filterQuery += "And price >= " + Double.parseDouble(minPrice);
                }
            }
        }
        ProductDAO pDAO = new ProductDAO();
        List<Product> listProductsByCategory = pDAO.getAllProductsByFilter(filterQuery);
        request.setAttribute("rating", rating);
        request.setAttribute("minValue", minPrice);
        request.setAttribute("maxValue", maxPrice);
        request.setAttribute("listProductsByCategory", listProductsByCategory);

        request.getRequestDispatcher("category.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
