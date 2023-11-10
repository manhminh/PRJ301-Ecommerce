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
import models.Cart;

/**
 *
 * @author Admin
 */
public class CartDAO {

    public Cart getCartUser(int userId) {
        String sql = "Select * from Cart where user_id=?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, userId);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                return new Cart(rs.getInt(1), rs.getInt(2));
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return null;
    }

    public void createCart(int userId) {
        String sql = "Insert into Cart(user_id) Values(?)";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, userId);
            pre.executeUpdate();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }
}
