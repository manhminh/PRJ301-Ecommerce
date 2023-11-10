/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import db.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.OrderDetails;

/**
 *
 * @author Admin
 */
public class OrderDetailsDAO {

    public void addOrderDetails(OrderDetails order) throws SQLException {
        String sql = "Insert into OrderDetails (order_id, product_id, quantity, price, date, status_id, shipping_id) Values(?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, order.getOrderId());
            pre.setInt(2, order.getProductId());
            pre.setInt(3, order.getQuantity());
            pre.setDouble(4, order.getPrice());
            pre.setString(5, order.getDate());
            pre.setInt(6, 1);
            pre.setInt(7, order.getShippingId());

            pre.executeUpdate();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }

    public void deleteOrderDetails(int orderDetailsId) {
        String sql = "Delete from OrderDetails where orderDetails_id =?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, orderDetailsId);

            pre.executeUpdate();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }

    public List<OrderDetails> getAllItems(int orderId) {
        String sql = "Select * from OrderDetails where order_id=? order by orderDetails_id  desc";
        List<OrderDetails> items = new ArrayList<>();
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, orderId);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                items.add(new OrderDetails(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getDouble(5), rs.getString(6), rs.getInt(7), rs.getInt(8)));
            }
            return items;
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return null;
    }

    public List<OrderDetails> getAllItemsSold(int userId) {
        String sql = "Select * from OrderDetails od, Product p where od.product_id = p.product_id and p.soldout > 0 and sale_id=? order by date desc";
        List<OrderDetails> items = new ArrayList<>();
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, userId);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                items.add(new OrderDetails(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getDouble(5), rs.getString(6), rs.getInt(7), rs.getInt(8)));
            }
            return items;
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return null;
    }

    public OrderDetails getOrderDetailsById(int orderDetailsId) {
        String sql = " Select * from OrderDetails where orderDetails_id=?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, orderDetailsId);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                return (new OrderDetails(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getDouble(5), rs.getString(6), rs.getInt(7), rs.getInt(8)));

            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return null;
    }

    public List<OrderDetails> filterOrderDetails(String sql) {
        List<OrderDetails> items = new ArrayList<>();
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                items.add(new OrderDetails(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getDouble(5), rs.getString(6), rs.getInt(7), rs.getInt(8)));
            }
            return items;
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return null;
    }

    public void updateStatusOrderDetails(OrderDetails od) {
        String sql = "Update OrderDetails set status_id=? where orderDetails_id=?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, od.getStatusId());
            pre.setInt(2, od.getOrderDetailsId());

            pre.executeUpdate();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }

    public void updateShippingOrderDetails(OrderDetails od) {
        String sql = "Update OrderDetails set shipping_id=? where orderDetails_id=?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, od.getShippingId());
            pre.setInt(2, od.getOrderDetailsId());

            pre.executeUpdate();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }

}
