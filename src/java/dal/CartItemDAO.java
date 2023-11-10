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
import models.CartItem;

/**
 *
 * @author Admin
 */
public class CartItemDAO {

    public void addItem(CartItem item) {
        String sql = "Insert into CartItem (product_id, quantity, price, cart_id) Values(?,?,?,?)";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, item.getProductId());
            pre.setInt(2, item.getQuantity());
            pre.setDouble(3, item.getPrice());
            pre.setInt(4, item.getCartId());

            pre.executeUpdate();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }

    public void deleteItem(int itemId) {
        String sql = "Delete from CartItem where cartItem_id = ?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, itemId);

            pre.executeUpdate();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }

    public CartItem getItemById(int itemId) {
        String sql = "Select * from CartItem where cartItem_id = ?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, itemId);

            ResultSet rs = pre.executeQuery();
            while(rs.next()) {
                return new CartItem(rs.getInt(1), rs.getInt(4), rs.getDouble(5), rs.getInt(3), rs.getInt(2));
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return null;
    }

    public void updateItem(CartItem item) {
        String sql = "Update CartItem set quantity=? where cartItem_id= ?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, item.getQuantity());
            pre.setInt(2, item.getCiId());

            pre.executeUpdate();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }

    public List<CartItem> getAllItems(int cartId) throws SQLException {
        String sql = "Select * from CartItem where cart_id = ? order by cartItem_id asc";
        List<CartItem> items = new ArrayList<>();
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, cartId);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                items.add(new CartItem(rs.getInt(1), rs.getInt(4), rs.getDouble(5), rs.getInt(3), rs.getInt(2)));
            }
            return items;
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return null;
    }
    
    public void removeAllItemsByCartId(int cartId) {
        String sql = "Delete From CartItem where cart_id  =  ?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, cartId);
            pre.executeUpdate();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }
}
