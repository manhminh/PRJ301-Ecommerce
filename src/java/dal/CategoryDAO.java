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
import models.Category;

/**
 *
 * @author Admin
 */
public class CategoryDAO {
    public ArrayList<Category> getAllCategories() {
        String sql = "Select * from [Category]";
        ArrayList<Category> categories = new ArrayList<>();
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String description = rs.getString(3);
                
                categories.add(new Category(id, name, description));
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error.getMessage());
        }
        return categories; 
    }

    public static void main(String[] args) {
        CategoryDAO cDAO = new CategoryDAO();
        ArrayList<Category> list = cDAO.getAllCategories();
        list.forEach((t) -> {
            System.out.println(t);
        });
    }
}
