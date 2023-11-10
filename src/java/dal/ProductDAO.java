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
import models.Product;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    public ArrayList<Product> getAllProducts() {
        String sql = "Select * from Product";
        ArrayList<Product> products = new ArrayList();
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getFloat(9), rs.getInt(10), rs.getInt(11));
                products.add(product);
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return products;
    }

    public ArrayList<Product> getAllProductsBySeller(int saleId) {
        String sql = "Select * from Product where sale_id=?";
        ArrayList<Product> products = new ArrayList();
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, saleId);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getFloat(9), rs.getInt(10), rs.getInt(11));
                products.add(product);
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return products;
    }

    public ArrayList<Product> getAllProductsByCategory(int cId) {
        String sql = "Select * from Product where category_id = ?";
        ArrayList<Product> products = new ArrayList();
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, cId);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getFloat(9), rs.getInt(10), rs.getInt(11));
                products.add(product);
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return products;
    }

    public Product getProductById(int id) {
        String sql = "Select * from Product "
                + "where product_id=?";
        Product product = null;
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                product = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getFloat(9), rs.getInt(10), rs.getInt(11));
                return product;
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return product;
    }

    public ArrayList<Product> getAllProductsByName(String textSearch) {
        String sql = "Select * from Product where name like ?";
        ArrayList<Product> products = new ArrayList();
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString(1, "%" + textSearch + "%");

            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getFloat(9), rs.getInt(10), rs.getInt(11));
                products.add(product);
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return products;
    }

    public ArrayList<Product> getTop3Products(int cId) {
        String sql = "Select top 3 * from Product where category_id = ?";
        ArrayList<Product> products = new ArrayList();
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, cId);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getFloat(9), rs.getInt(10), rs.getInt(11));
                products.add(product);
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return products;
    }

    public ArrayList<Product> getNext3Products(int amount, int cId) {
        String sql = "Select * from Product where category_id=? order by product_id offset ? rows fetch next 3 rows only";
        ArrayList<Product> products = new ArrayList();
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, cId);
            pre.setInt(2, amount);

            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getFloat(9), rs.getInt(10), rs.getInt(11));
                products.add(product);
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return products;
    }

    public void createNewProduct(Product product, int userId) {
        String sql = "Insert into Product(name, description, quantity, price, category_id, image, rating, discount, sale_id, soldout) Values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);

            pre.setString(1, product.getName());
            pre.setString(2, product.getDescription());
            pre.setInt(3, product.getQuantity());
            pre.setDouble(4, product.getPrice());
            pre.setInt(5, product.getCategoryId());
            pre.setString(6, product.getImage());
            pre.setInt(7, product.getRating());
            pre.setFloat(8, product.getDiscount());
            pre.setInt(9, userId);
            pre.setFloat(10, 0);

            pre.executeUpdate();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }

    public void updateProduct(Product product) {
        String sql = "Update Product set name = ?, description = ?, quantity = ?, price = ?, category_id = ?, image = ?, rating  = ?, discount = ? where product_id = ?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString(1, product.getName());
            pre.setString(2, product.getDescription());
            pre.setInt(3, product.getQuantity());
            pre.setDouble(4, product.getPrice());
            pre.setInt(5, product.getCategoryId());
            pre.setString(6, product.getImage());
            pre.setInt(7, product.getRating());
            pre.setDouble(8, product.getDiscount());
            pre.setInt(9, product.getId());

            pre.executeUpdate();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }

    public void deleteProduct(int id) {
        String sql = "Delete Product where product_id = ?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, id);

            pre.executeUpdate();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }

    public int getTotalProducts(int saleId) {
        String sql = "select count(*) from Product where sale_id = ?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, saleId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return 0;
    }

    public ArrayList<Product> getAllProductsWithPagination(int saleId, int page, int limit) {
        ArrayList<Product> products = new ArrayList();
        String sql = "SELECT * FROM Product where sale_id=? Order by product_id OFFSET ? ROWS FETCH FIRST ? ROWS ONLY";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, saleId);
            pre.setInt(2, (page - 1) * limit);
            pre.setInt(3, limit);

            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                products.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getFloat(9), rs.getInt(10), rs.getInt(11)));
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error.getMessage());
        }
        return products;
    }

    public void updateProductAfterCheckout(Product product) {
        String sql = "Update Product set quantity = ?, soldout = ? where sale_id=? and product_id=?";
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, product.getQuantity());
            pre.setInt(2, product.getSoldOut());
            pre.setInt(3, product.getSaleId());
            pre.setInt(4, product.getId());

            pre.executeUpdate();
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
    }

    public ArrayList<Product> getAllProductsByFilter(String sql) {
        ArrayList<Product> products = new ArrayList();
        try {
            Connection con = DBContext.makeConnection();
            PreparedStatement pre = con.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getFloat(9), rs.getInt(10), rs.getInt(11));
                products.add(product);
            }
        } catch (ClassNotFoundException | SQLException error) {
            System.out.println(error);
        }
        return products;
    }

    public static void main(String[] args) {
        ProductDAO pDAO = new ProductDAO();
        System.out.println(pDAO.getProductById(1));
    }
}
