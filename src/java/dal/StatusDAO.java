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
import models.Status;

/**
 *
 * @author Admin
 */
public class StatusDAO {

    public Status getStatusById(int id) {
        String sql = "Select * from Status "
                + "where status_id=?";
        Status status = null;
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                status = new Status(rs.getInt(1), rs.getString(2));
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return status;
    }

    public List<Status> getAllStatus() {
        String sql = "Select * from Status";
        List<Status> listStatus = new ArrayList<>();
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                listStatus.add(new Status(rs.getInt(1), rs.getString(2)));
            }
            return listStatus;
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return null;
    }
}
