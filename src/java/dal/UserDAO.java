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
import models.User;

/**
 *
 * @author Admin
 */
public class UserDAO {

    public ArrayList<User> getAllUsers() {
        String sql = "Select * from [User]";
        ArrayList<User> users = new ArrayList<>();
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                String email = rs.getString(4);
                int role = rs.getInt(5);
                String address = rs.getString(6);
                int gender = rs.getInt(7);
                String avatar = rs.getString(8);

                users.add(new User(id, username, password, email, role, address, gender, avatar));
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error.getMessage());
        }
        return users;
    }

    public User checkExistedEmail(String email) {
        String sql = "Select * from [User] "
                + "where email=?";
        User user = null;
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString(1, email);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getInt(7), rs.getString(8));
                return user;
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return user;
    }

    public void createNewUser(String email, String password) {
        String sql = "Insert into [User] ("
                + " email, password, role, avatar) "
                + "Values (?, ?, 1, 'avatarUser.jpg')";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);

            pre.setString(1, email);
            pre.setString(2, password);

            pre.executeUpdate();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }

    public User getUserById(int id) {
        String sql = "Select * from [User] "
                + "where user_id=?";
        User user = null;
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getInt(7), rs.getString(8));
                return user;
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return user;
    }

    public void editUser(String username, int role, String address, int gender, String avatar, int id) {
        String sql = "Update [User] "
                + "Set username=?, role=?, address=?, gender=?, avatar=? "
                + "where user_id=?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);

            pre.setString(1, username);
            pre.setInt(2, role);
            pre.setString(3, address);
            pre.setInt(4, gender);
            pre.setString(5, avatar);
            pre.setInt(6, id);

            pre.executeQuery();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }

    public void deleteUser(int id) {
        String sql = "Delete [User] where user_id=?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);

            pre.setInt(1, id);
            pre.executeUpdate();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }

    public int getTotalUsers() {
        String sql = "select count(*) from [User]";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return 0;
    }

    public ArrayList<User> getAllUsersWithPagination(int page, int limit) {
        ArrayList<User> users = new ArrayList();
        String sql = "SELECT * FROM [User] Order by user_id OFFSET ? ROWS FETCH FIRST ? ROWS ONLY";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, (page - 1) * limit);
            pre.setInt(2, limit);

            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                String email = rs.getString(4);
                int role = rs.getInt(5);
                String address = rs.getString(6);
                int gender = rs.getInt(7);
                String avatar = rs.getString(8);

                users.add(new User(id, username, password, email, role, address, gender, avatar));
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error.getMessage());
        }
        return users;
    }

    public User loginUser(String emailUser, String passwordUser) {
        User user = null;
        String sql = "Select * from [User] where email=? and password=?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString(1, emailUser);
            pre.setString(2, passwordUser);

            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getInt(7), rs.getString(8));
                return user;
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return user;
    }

    public void updateAddress(User user) {
        String sql = "Update [User] set address = ? where user_id=?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString(1, user.getAddress());
            pre.setInt(2, user.getId());

            pre.executeUpdate();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }

    public User checkPasswordUser(String password, int userId) {
        String sql = "Select * from [User] "
                + "where password=? and user_id = ?";
        User user = null;
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString(1, password);
            pre.setInt(2, userId);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getInt(7), rs.getString(8));
                return user;
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return user;
    }

    public void updateUserPassword(String password, int userId) {
        String sql = "Update [User] "
                + "Set password=? "
                + "where user_id=?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);

            pre.setString(1, password);
            pre.setInt(2, userId);

            pre.executeQuery();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }

    public static void main(String[] args) {
        UserDAO uDAO = new UserDAO();
        uDAO.createNewUser("m@gmail.com", "123");
    }
}
