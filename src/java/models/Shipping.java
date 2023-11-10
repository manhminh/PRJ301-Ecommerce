/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Admin
 */
public class Shipping {
    private int shippingId;
    private String name;
    private float price;
    int time;

    public Shipping() {
    }

    public Shipping(int shippingId, String name, float price, int time) {
        this.shippingId = shippingId;
        this.name = name;
        this.price = price;
        this.time = time;
    }

    public int getShippingId() {
        return shippingId;
    }

    public void setShippingId(int shippingId) {
        this.shippingId = shippingId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Shipping{" + "shippingId=" + shippingId + ", name=" + name + ", price=" + price + ", time=" + time + '}';
    }
    
}
