/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
import dal.CartItemDAO;
import dal.ProductDAO;
import dal.ReviewDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Cart;
import models.CartItem;
import models.Product;
import models.Review;
import models.User;

/**
 *
 * @author Admin
 */
public class DetailsProductController extends HttpServlet {

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
            out.println("<title>Servlet DetailsProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailsProductController at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("pId"));
        Product product = pDAO.getProductById(id);
        request.setAttribute("product", product);

        ReviewDAO rDAO = new ReviewDAO();
        int rate = rDAO.getRatingProduct(id);
        List<Review> reviews = rDAO.getAllReviewsProduct(id);
        request.setAttribute("reviews", reviews);
        request.setAttribute("rate", rate);

        CartDAO cartDAO = new CartDAO();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            Cart cart = cartDAO.getCartUser(user.getId());
            if (cart == null) {
                cartDAO.createCart(user.getId());
                cart = cartDAO.getCartUser(user.getId());
            }

            CartItemDAO ciDAO = new CartItemDAO();
            try {
                List<CartItem> items = ciDAO.getAllItems(cart.getCartId());

                double totalPrice = 0;
                for (CartItem item : items) {
                    totalPrice += item.getPrice() * item.getQuantity();
                }
                request.setAttribute("items", items);
                request.setAttribute("totalPrice", totalPrice);
            } catch (SQLException ex) {
                Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        request.setAttribute("user", user);
        request.getRequestDispatcher("detailsProduct.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
        }
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