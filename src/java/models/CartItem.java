/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Admin
 */
public class CartItem {
    private int ciId;
    private int quantity;
    private double price;
    private int cartId;
    private int productId;

    public CartItem() {
    }

    public CartItem(int quantity, double price, int cartId, int productId) {
        this.quantity = quantity;
        this.price = price;
        this.cartId = cartId;
        this.productId = productId;
    }
    
    

    public CartItem(int ciId, int quantity, double price, int cartId, int productId) {
        this.ciId = ciId;
        this.quantity = quantity;
        this.price = price;
        this.cartId = cartId;
        this.productId = productId;
    }

    public CartItem(int ciId, int quantity) {
        this.ciId = ciId;
        this.quantity = quantity;
    }


    public int getCiId() {
        return ciId;
    }

    public void setCiId(int ciId) {
        this.ciId = ciId;
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

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Override
    public String toString() {
        return "CartItem{" + "ciId=" + ciId + ", quantity=" + quantity + ", price=" + price + ", cartId=" + cartId + ", productId=" + productId + '}';
    }
    
}
