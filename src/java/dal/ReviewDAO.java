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
import models.Product;
import models.Review;

/**
 *
 * @author Admin
 */
public class ReviewDAO {

    public void createUserReview(Review review) {
        String sql = "Insert into Review (user_id, product_id, content, date, rating) values(?, ?, ?, ?, ?)";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, review.getUserId());
            pre.setInt(2, review.getProductId());
            pre.setString(3, review.getContent());
            pre.setString(4, review.getDate());
            pre.setInt(5, review.getRating());

            pre.executeUpdate();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }

    public List<Review> getAllReviewsProduct(int productId) {
        String sql = "Select * from Review where product_id=? order by date desc";
        List<Review> reviews = new ArrayList<>();

        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, productId);

            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                reviews.add(new Review(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6)));
            }
            return reviews;
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return null;
    }

    public void deleteReviewProduct(int reviewId) {
        String sql = "Delete Review where review_id=?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, reviewId);

            pre.executeUpdate();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }

    public Review getReviewById(int reviewId) {
        String sql = "Select * from Review where review_id=?";
        Review review = null;
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, reviewId);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                review = new Review(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6));
                return review;
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return review;
    }
    
    public Review getReviewByUserId(int id) {
        String sql = "Select * from Review where review_id = (Select top 1 review_id from Review where user_id=? order by review_id desc)";
        Review review = null;
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                review = new Review(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6));
                return review;
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return review;
    }

    public void updateReview(Review review) {
        String sql = "Update Review set content = ?, rating = ? where product_id=? and user_id=? and review_id=?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString(1, review.getContent());
            pre.setInt(2, review.getRating());
            pre.setInt(3, review.getProductId());
            pre.setInt(4, review.getUserId());
            pre.setInt(5, review.getId());

            pre.executeUpdate();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }

    public int getRatingProduct(int productId) {
        String sql = "Select AVG(rating) from Review where product_id = ?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, productId);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                int rate = rs.getInt(1);
                return rate;
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return 0;
    }

    public static void main(String[] args) {
        ReviewDAO rDAO = new ReviewDAO();
        Review r = rDAO.getReviewByUserId(33);
        System.out.println(r);
    }
}
