/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import models.Product;

/**
 *
 * @author Admin
 */
public class LoadMoreController extends HttpServlet {

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
            out.println("<title>Servlet LoadMoreController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoadMoreController at " + request.getContextPath() + "</h1>");
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
        ProductDAO pDAO = new ProductDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        ArrayList<Product> listProducts = pDAO.getNext3Products(amount, id);

        try ( PrintWriter out = response.getWriter()) {
            for (Product product : listProducts) {
                out.println("                                                <div class=\"col-sm-6 col-md-4 wow fadeInUp products\">\n"
                        + "                                                        <div class=\"product\" style=\" box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px\">\n"
                        + "                                                            <div class=\"product-image\">\n"
                        + "                                                                <div class=\"image\"> <a href=\"detailsProduct?pId=" + product.getId() + "\">\n"
                        + "                                                                        <img src=\"images/"+ product.getImage() + "\" alt=\"\"></a> \n"
                        + "                                                                </div>\n"
                        + "                                                            </div>\n"
                        + "                                                            <div class=\"product-info\" style=\"width: 50%; margin: auto; border-top: 1px solid #ddd\">\n"
                        + "                                                                <h3 class=\"name\"><a style=\"font-weight: 600; font-size: 16px\" href=\"detailsProduct?pId=" + product.getId() + "\">" + product.getName() + "</a></h3>\n"
                        + "                                                                <div class=\"rating-product\">\n"
                        + "                                                                    <span style=\"color: #555; font-weight: 600\">Rating:</span>\n"
                        + "                                                                    <span style=\"color: #aaa; font-weight: 600; margin-left: 4px\">" + product.getRating() + "</span>\n"
                        + "                                                                    /<span style=\"font-weight: 600\">5</span>\n"
                        + "                                                                    <i class=\"fa fa-star\" style=\"color: orange\"></i>\n"
                        + "                                                                </div>\n"
                        + "                                                                <div class=\"description\"></div>\n"
                        + "                                                                <div class=\"product-price\" style=\"position: relative\"> \n"
                        + "                                                                    <span style=\"font-weight: 600; color: #555; margin-right: 4px\">Price: </span>\n"
                        + "                                                                    <span class=\"price-before-discount\">$" + product.getPrice() + "</span>\n"
                        + "                                                                    <span style=\"color: red; position: absolute; font-size: 11px\">-" + Math.round(product.getDiscount() * 100) + "%</span>\n"
                        + "                                                                    <div class=\"price\" >\n"
                        + "                                                                        $" + product.getPriceAfterDiscount() + "\n"
                        + "                                                                    </div>\n"
                        + "                                                                </div>\n"
                        + "                                                            </div>\n"
                        + "                                                        </div>\n"
                        + "                                                </div>");
            }
        }

        request.getRequestDispatcher("category?cId="+id).forward(request, response);
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
