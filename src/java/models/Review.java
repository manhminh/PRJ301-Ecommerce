/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Admin
 */
public class Review {
    private int id;
    private int userId;
    private int productId;
    private String content;
    private String date;
    private int rating;

    public Review() {
    }

    public Review(int userId, int productId, String content, String date, int rating) {
        this.userId = userId;
        this.productId = productId;
        this.content = content;
        this.date = date;
        this.rating = rating;
    }

    public Review(int id, int userId, int productId, String content, String date, int rating) {
        this.id = id;
        this.userId = userId;
        this.productId = productId;
        this.content = content;
        this.date = date;
        this.rating = rating;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "Review{" + "id=" + id + ", userId=" + userId + ", productId=" + productId + ", content=" + content + ", date=" + date + ", rating=" + rating + '}';
    }
    
}
