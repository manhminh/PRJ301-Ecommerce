/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Admin
 */
public class OrderDetails {

    private int orderDetailsId;
    private int orderId;
    private int productId;
    private int quantity;
    private double price;
    private String date;
    private int statusId;
    private int shippingId;

    public OrderDetails() {
    }

    public OrderDetails(int orderId, int productId, int quantity, double price, String date) {
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
        this.date = date;
    }


    public OrderDetails(int orderId, int productId, int quantity, double price, String date, int shippingId) {
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
        this.date = date;
        this.shippingId = shippingId;
    }

    public OrderDetails(int orderDetailsId, int orderId, int productId, int quantity, double price, String date, int statusId, int shippingId) {
        this.orderDetailsId = orderDetailsId;
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
        this.date = date;
        this.statusId = statusId;
        this.shippingId = shippingId;
    }
    
    

    public int getOrderDetailsId() {
        return orderDetailsId;
    }

    public void setOrderDetailsId(int orderDetailsId) {
        this.orderDetailsId = orderDetailsId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public int getShippingId() {
        return shippingId;
    }

    public void setShippingId(int shippingId) {
        this.shippingId = shippingId;
    }

    @Override
    public String toString() {
        return "OrderDetails{" + "orderDetailsId=" + orderDetailsId + ", orderId=" + orderId + ", productId=" + productId + ", quantity=" + quantity + ", price=" + price + ", date=" + date + ", statusId=" + statusId + '}';
    }

}
