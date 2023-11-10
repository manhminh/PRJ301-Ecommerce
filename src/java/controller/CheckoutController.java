/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
import dal.CartItemDAO;
import dal.OrderDAO;
import dal.OrderDetailsDAO;
import dal.ProductDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Cart;
import models.CartItem;
import models.Order;
import models.OrderDetails;
import models.Product;
import models.User;

@MultipartConfig(maxFileSize = 16177215)
/**
 *
 * @author Admin
 */
public class CheckoutController extends HttpServlet {

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
            out.println("<title>Servlet CheckoutController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String currentDate = formatter.format(date);

        if (user != null) {
            try {
                CartDAO cartDAO = new CartDAO();
                Cart cart = cartDAO.getCartUser(user.getId());
                if (cart == null) {
                    cartDAO.createCart(user.getId());
                    cart = cartDAO.getCartUser(user.getId());
                }

                OrderDAO oDAO = new OrderDAO();
                Order order = oDAO.getUserOrder(user.getId());
                if (order == null) {
                    oDAO.createNewOrder(user.getId());
                    order = oDAO.getUserOrder(user.getId());
                }

                CartItemDAO ciDAO = new CartItemDAO();
                List<CartItem> items = ciDAO.getAllItems(cart.getCartId());

                OrderDetailsDAO odDAO = new OrderDetailsDAO();
                if (!items.isEmpty()) {
                    for (CartItem item : items) {
                        OrderDetails od = new OrderDetails(order.getId(), item.getProductId(), item.getQuantity(), item.getPrice(), currentDate);
                        odDAO.addOrderDetails(od);
                        ProductDAO pDAO = new ProductDAO();
                        Product product = pDAO.getProductById(od.getProductId());
                        product.setSoldOut(product.getSoldOut() + item.getQuantity());
                        product.setQuantity(product.getQuantity() - item.getQuantity());
                        pDAO.updateProductAfterCheckout(product);
                    }
                    ciDAO.removeAllItemsByCartId(cart.getCartId());
                }
            } catch (SQLException ex) {
                Logger.getLogger(CheckoutController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        response.sendRedirect("order-details");
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
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String currentDate = formatter.format(date);
        int shippingId = Integer.parseInt(request.getParameter("shipping").substring(9, 10));

        if (user != null) {
            try {
                CartDAO cartDAO = new CartDAO();
                Cart cart = cartDAO.getCartUser(user.getId());
                if (cart == null) {
                    cartDAO.createCart(user.getId());
                    cart = cartDAO.getCartUser(user.getId());
                }

                OrderDAO oDAO = new OrderDAO();
                Order order = oDAO.getUserOrder(user.getId());
                if (order == null) {
                    oDAO.createNewOrder(user.getId());
                    order = oDAO.getUserOrder(user.getId());
                }

                CartItemDAO ciDAO = new CartItemDAO();
                List<CartItem> items = ciDAO.getAllItems(cart.getCartId());

                OrderDetailsDAO odDAO = new OrderDetailsDAO();
                if (!items.isEmpty()) {
                    for (CartItem item : items) {
                        OrderDetails od = new OrderDetails(order.getId(), item.getProductId(), item.getQuantity(), item.getPrice(), currentDate, shippingId);
                        odDAO.addOrderDetails(od);
                        ProductDAO pDAO = new ProductDAO();
                        Product product = pDAO.getProductById(od.getProductId());
                        product.setSoldOut(item.getQuantity() + product.getSoldOut());
                        product.setQuantity(product.getQuantity() - item.getQuantity());
                        pDAO.updateProductAfterCheckout(product);
                    }
                    ciDAO.removeAllItemsByCartId(cart.getCartId());
                } else {
                    response.getWriter().print("Failed");
                    return;
                }
                String province = request.getParameter("province");
                String district = request.getParameter("district");
                String wards = request.getParameter("wards");
                UserDAO uDAO = new UserDAO();
                user.setAddress(province + ", " + district + ", " + wards);

                uDAO.updateAddress(user);
                response.getWriter().print("OK");
            } catch (SQLException ex) {
                Logger.getLogger(CheckoutController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            response.getWriter().print("Failed");
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
