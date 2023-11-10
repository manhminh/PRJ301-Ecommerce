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
import models.Shipping;

/**
 *
 * @author Admin
 */
public class ShippingDAO {
    public Shipping getShippingById(int id) {
        String sql = "Select * from Shipping "
                + "where shipping_id=?";
        Shipping shipping = null;
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                shipping = new Shipping(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getInt(4));
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return shipping;
    }

    public List<Shipping> getAllShipping() {
        String sql = "Select * from Shipping";
        List<Shipping> listStatus = new ArrayList<>();
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                listStatus.add(new Shipping(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getInt(4)));
            }
            return listStatus;
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return null;
    }
}
