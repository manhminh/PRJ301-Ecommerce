/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDetailsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import models.OrderDetails;
import models.User;

/**
 *
 * @author Admin
 */
public class ManageOrdersControler extends HttpServlet {

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
            out.println("<title>Servlet ManageOrdersControler</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageOrdersControler at " + request.getContextPath() + "</h1>");
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
        OrderDetailsDAO odDAO = new OrderDetailsDAO();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null && user.getRole() != 1) {
            List<OrderDetails> orders = odDAO.getAllItemsSold(user.getId());
            request.setAttribute("orders", orders);
        } else {
            response.sendRedirect("login");
            return;
        }
        request.getRequestDispatcher("manageOrders.jsp").forward(request, response);
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
        User seller = (User) session.getAttribute("user");
        if (seller == null) {
            response.sendRedirect("login");
            return;
        }
        String filterQuery = "Select * from OrderDetails od, Product p, Shipping sh where od.product_id = p.product_id and od.shipping_id = sh.shipping_id and sale_id = " + seller.getId();
        String minPrice = request.getParameter("minPrice");
        String maxPrice = request.getParameter("maxPrice");
        String minDate = request.getParameter("minDate");
        String maxDate = request.getParameter("maxDate");
        String sortValue = request.getParameter("sortValue");

        if (!minPrice.isEmpty()) {
            filterQuery += "and (od.price*od.quantity+sh.price) >= " + Double.parseDouble(minPrice);
        }
        if (!maxPrice.isEmpty()) {
            filterQuery += "and (od.price*od.quantity+sh.price) <= " + Double.parseDouble(maxPrice);
        }
        if (!minDate.isEmpty()) {
            filterQuery += "and od.date >= " + "'" + minDate + "'";
        }
        if (!maxDate.isEmpty()) {
            filterQuery += "and od.date <= " + "'" + maxDate + "'";
        }
        if (!sortValue.isEmpty()) {
            filterQuery += "order by " + sortValue + " desc";
        }

        OrderDetailsDAO odDAO = new OrderDetailsDAO();
        List<OrderDetails> orders = odDAO.filterOrderDetails(filterQuery);

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("manageOrders.jsp").forward(request, response);
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
