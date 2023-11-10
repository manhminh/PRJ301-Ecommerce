/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Admin
 */
public class Product {

    private int id;
    private String name;
    private int quantity;
    private double price;
    private String description;
    private String image;
    private int rating;
    private float discount;
    private int categoryId;
    private int saleId;
    private int soldOut;

    public Product() {
    }

    public Product(String name, int quantity, double price, String description, String image, int rating, float discount, int categoryId) {
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.description = description;
        this.image = image;
        this.rating = rating;
        this.discount = discount;
        this.categoryId = categoryId;
    }
    
    

    public Product(int id, String name, int quantity, double price, String description, int categoryId, String image, int rating, float discount, int saleId, int soldOut) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.description = description;
        this.image = image;
        this.rating = rating;
        this.discount = discount;
        this.categoryId = categoryId;
        this.saleId = saleId;
        this.soldOut = soldOut;
    }

    public Product(int id, String name, int quantity, double price, String description, int categoryId, String image, int rating, float discount) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.description = description;
        this.image = image;
        this.rating = rating;
        this.discount = discount;
        this.categoryId = categoryId;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
    
    public double getPriceAfterDiscount() {
        return Double.parseDouble(String.format("%.2f", (price - price*discount)));
    }

    public int getSaleId() {
        return saleId;
    }

    public void setSaleId(int saleId) {
        this.saleId = saleId;
    }

    public int getSoldOut() {
        return soldOut;
    }

    public void setSoldOut(int soldOut) {
        this.soldOut = soldOut;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", quantity=" + quantity + ", price=" + price + ", description=" + description + ", image=" + image + ", rating=" + rating + ", discount=" + discount + ", categoryId=" + categoryId + ", saleId=" + saleId + ", soldOut=" + soldOut + '}';
    }

}
