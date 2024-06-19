/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author MTTRBLX
 */
public class Product {
    private String id;
    private String name;
    private int categoryID;
    private double price;
    private String image;
    private int quantity;
    private String description;
    private double discount;
    private Categories category;
    private String status;
    
    public Product() {
    }

    public Product(String id, String name, int categoryID, double price, String image, int quantity, String description, double discount) {
        this.id = id;
        this.name = name;
        this.categoryID = categoryID;
        this.price = price;
        this.image = image;
        this.quantity = quantity;
        this.description = description;
        this.discount = discount;
    }
    
    public Product(String id, String name, double price, String image, int quantity, String description, double discount, Categories category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.quantity = quantity;
        this.description = description;
        this.discount = discount;
        this.category = category;
    }
    
    public Product(String id, String name, double price, String image, int quantity, String description, double discount, String status, Categories category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.quantity = quantity;
        this.description = description;
        this.discount = discount;
        this.status = status;
        this.category = category;
        
    }


    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", categoryID=" + categoryID + ", price=" + price + ", image=" + image + ", quantity=" + quantity + ", description=" + description + ", discount=" + discount + '}';
    }
    
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public double getPrice() {
        return price;
    }
    
    public String getFormattedPrice() {
        return String.format("%.0f", price);
    }
    
    public String getFormattedDiscount() {
        return String.format("%.0f", discount);
    }
    
    public String getPercentDiscount() {
        return String.format("%.0f",price - price * (discount/100));
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public Categories getCategory() {
        return category;
    }

    public void setCategory(Categories category) {
        this.category = category;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
