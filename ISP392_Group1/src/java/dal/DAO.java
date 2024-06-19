/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Account;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Categories;
import model.Product;

/**
 *
 * @author KimHo
 */
public class DAO extends DBContext {

    // tao tai khoan
    public void add(Account a) {

        String sql = "INSERT INTO `ACCOUNT` (`username`, `email`, `password`, `auth_method`, `role`) VALUES (?, ?, ?, ?, ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getEmail());
            st.setString(3, a.getPassword());
            st.setString(4, "local");
            st.setString(5, "user");
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void update(Account a) {
        String sql = "UPDATE account set username= ? ,password = ? where email= ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUsername());
//            st.setString(2, a.getEmail());
            st.setString(2, a.getPassword());
            st.setString(3, a.getEmail());
//            st.setString(4, "local");
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public boolean checkUser(String username) {

        String sql = "SELECT * FROM `ACCOUNT` WHERE `username`=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean checkUserEmail(String email) {
        String sql = "select * from account where email= ? and auth_method = 'google' ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
//   TMS

    public DAO() {
        connectDB();
    }
    //Khai bao cac thanh phan xy ly databse
    Connection cnn;//Ket noi db
    PreparedStatement stm; //Thuc hien cac cau lenh sql
    ResultSet rs;//Dung de luu tru va xu ly du lieu lay ve tu select

    private void connectDB() {
        cnn = connection;
        if (cnn != null) {
            System.out.println("Connect success");
        } else {
            System.out.println("Connect fail");
        }
    }

    public void insertUserUsingGoogle(Account u) {
        try {
            String strSQL = "INSERT INTO Account (email, password, auth_method) VALUES (?, NULL, ?)";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, u.email);
            stm.setString(2, "google");
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            // Optionally, log more details or handle specific cases
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("Error Code: " + ex.getErrorCode());
            System.out.println("Message: " + ex.getMessage());
            Throwable t = ex.getCause();
            while (t != null) {
                System.out.println("Cause: " + t);
                t = t.getCause();
            }
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (cnn != null) {
                    cnn.close();
                }
            } catch (Exception e) {
                System.out.println("Finally block: " + e.getMessage());
            }
        }
    }

    public boolean checkUserUsingGoogle(String email) {
        try {
            String strSQL = "select * from account where email = ? and auth_method = 'local' ";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, email);

            rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("checkUserUsingGoogle" + e.getMessage());
        }
        return false;
    }

    public boolean checkUser1(String username, String password) {
        try {
            String strSQL = "select * from ACCOUNT where username = ? and password = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("checkUser1" + e.getMessage());
        }
        return false;
    }

    public boolean checkUserAndEmail(String username, String email) {
        try {
            String strSQL = "select * from ACCOUNT where username = ? and password = email";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, username);
            stm.setString(2, email);
            rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("checkUserAndEmail" + e.getMessage());
        }
        return false;
    }

//    public Account getUserByName(String username) {
//        Account account = null;
//        try {
//            String strSQL = "SELECT username, password, email FROM Account WHERE username = ?";
//            stm = cnn.prepareStatement(strSQL);
//            stm.setString(1, username);
//            rs = stm.executeQuery();
//            if (rs.next()) {
//                String user = rs.getString("username");
//                String pass = rs.getString("password");
//                String email = rs.getString("email");
//
//                account = new Account(user, email, pass);
//            }
//        } catch (SQLException e) {
//            System.out.println("getUserByName: " + e.getMessage());
//        } finally {
//            // Close resources
//            try {
//                if (rs != null) {
//                    rs.close();
//                }
//                if (stm != null) {
//                    stm.close();
//                }
//                if (cnn != null) {
//                    cnn.close();
//                }
//            } catch (SQLException e) {
//                System.out.println("getUserByName (finally block): " + e.getMessage());
//            }
//        }
//        return account;
//    }
    public String getEmailByName(String username) {
        String email = null;
        try {
            String strSQL = "SELECT email FROM account WHERE username = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, username);
            rs = stm.executeQuery();
            if (rs.next()) {
                email = rs.getString("email");
            }
        } catch (SQLException e) {
            System.out.println("getEmailByName: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (cnn != null) {
                    cnn.close();
                }
            } catch (SQLException e) {
                System.out.println("getEmailByName (finally block): " + e.getMessage());
            }
        }
        return email;
    }

    public Account getUserByEmail(String email) {
        Account account = null;
        try {
            String strSQL = "SELECT username, password, email FROM ACCOUNT WHERE email = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, email);
            rs = stm.executeQuery();
            if (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                String userEmail = rs.getString("email");
                account = new Account(username, email, password);
            }
        } catch (SQLException e) {
            System.out.println("getUserByEmail: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (cnn != null) {
                    cnn.close();
                }
            } catch (SQLException e) {
                System.out.println("getUserByEmail (finally block): " + e.getMessage());
            }
        }
        return account;
    }

    //Hung
    public Account checkAuthen(String username, String password) {
        String sql = "SELECT * FROM `ACCOUNT` WHERE `username`=? AND `password`=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                // Trả về một đối tượng account với username, password
                return new Account(username, password);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean isAdmin(String username) {
        String sql = "SELECT isAdmin FROM Account WHERE username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getBoolean("isAdmin");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean updatePassword(String email, String newPassword) {
        String sql = "update account set password = ? where email=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newPassword);
            st.setString(2, email);
            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean checkEmail(String email) {
        String sql = "select * from account where email=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public Product getProductsById(String id) {
        String sql = "select * from PRODUCT where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                Product p = new Product(rs.getString("id"), rs.getString("name"), rs.getDouble("price"), rs.getString("image"),
                        rs.getInt("quantity"), rs.getString("description"), rs.getDouble("discount"), c);

                return p;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public void insertP(Product p) {
        String sql = "INSERT INTO PRODUCT (id, name, categoryID, price, image, quantity, description, discount) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getId());
            st.setString(2, p.getName());
            st.setInt(3, p.getCategory().getId());
            st.setDouble(4, p.getPrice());
            st.setString(5, p.getImage());
            st.setInt(6, p.getQuantity());
            st.setString(7, p.getDescription());
            st.setDouble(8, p.getDiscount());
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void updateP(Product p) {
        String sql = "UPDATE PRODUCT SET name=?, price=?, quantity=?, description=?, discount=?, image=?, categoryID=? WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setDouble(2, p.getPrice());
            st.setInt(3, p.getQuantity());
            st.setString(4, p.getDescription());
            st.setDouble(5, p.getDiscount());
            st.setString(6, p.getImage());
            st.setInt(7, p.getCategory().getId());
            st.setString(8, p.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // view all category
    public List<Categories> getCategory() {
        List<Categories> list = new ArrayList<>();
        String sql = "select * from CATEGORY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Categories c = new Categories(rs.getInt("id"), rs.getString("name"));
                list.add(c);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public Categories getCategoryById(int id) {
        String sql = "select * from CATEGORY where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rse = st.executeQuery();
            if (rse.next()) {
                Categories c = new Categories(rse.getInt("id"),
                        rse.getString("name"));
                return c;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    // view all product
    public List<Product> getProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from PRODUCT";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rse = st.executeQuery();
            while (rse.next()) {
                Categories c = getCategoryById(rse.getInt("categoryID"));
                Product p = new Product(rse.getString("id"),
                        rse.getString("name"),
                        rse.getDouble("price"),
                        rse.getString("image"),
                        rse.getInt("quantity"),
                        rse.getString("description"),
                        rse.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public int countAllProduct() {
        String sql = "select count(*) from PRODUCT";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }

        return 0;
    }

    public int countAllProductOfCategory(String cid) {
        String sql = "select count(*) from PRODUCT where categoryID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }

        return 0;
    }

    public List<Product> getTop12() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM PRODUCT LIMIT 12;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rse = st.executeQuery();
            while (rse.next()) {
                Categories c = getCategoryById(rse.getInt("categoryID"));
                Product p = new Product(rse.getString("id"),
                        rse.getString("name"),
                        rse.getDouble("price"),
                        rse.getString("image"),
                        rse.getInt("quantity"),
                        rse.getString("description"),
                        rse.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Product> getProductByIndex(int offset, int limit) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM PRODUCT ORDER BY categoryID LIMIT ?, ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, offset);
            st.setInt(2, limit);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }


    public List<Product> getProductsByCid(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from PRODUCT where categoryID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rse = st.executeQuery();
            while (rse.next()) {
                Categories c = getCategoryById(rse.getInt("categoryID"));
                Product p = new Product(rse.getString("id"),
                        rse.getString("name"),
                        rse.getDouble("price"),
                        rse.getString("image"),
                        rse.getInt("quantity"),
                        rse.getString("description"),
                        rse.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }


    public List<Product> getProductsByCid(String cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from PRODUCT where categoryID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            ResultSet rse = st.executeQuery();
            while (rse.next()) {
                Categories c = getCategoryById(rse.getInt("categoryID"));
                Product p = new Product(rse.getString("id"),
                        rse.getString("name"),
                        rse.getDouble("price"),
                        rse.getString("image"),
                        rse.getInt("quantity"),
                        rse.getString("description"),
                        rse.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }


    public List<Product> getProductsByPageSorted(int offset, int limit, String sort, String categoryId) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM PRODUCT";
            if (categoryId != null && !categoryId.isEmpty()) {
                sql += " WHERE categoryId = ?";
            }
            switch (sort) {
                case "ASC":
                    sql += " ORDER BY price ASC";
                    break;
                case "DESC":
                    sql += " ORDER BY price DESC";
                    break;
                case "Name":
                    sql += " ORDER BY name";
                    break;
            }
            sql += " LIMIT ?, ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            int paramIndex = 1;
            if (categoryId != null && !categoryId.isEmpty()) {
                ps.setString(paramIndex++, categoryId);
            }
            ps.setInt(paramIndex++, offset);
            ps.setInt(paramIndex, limit);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    //search products

    public List<Product> searchProducts(String txt) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE name LIKE ? OR price LIKE ? OR quantity LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            String searchPattern = "%" + txt + "%";
            st.setString(1, searchPattern);
            st.setString(2, searchPattern);
            st.setString(3, searchPattern);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                list.add(new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getInt("price"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getInt("discount"),
                        rs.getString("status"), c));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //search product in a particular category
    public List<Product> searchProductsByCid(int categoryID, String txt) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE categoryID = ? and (name LIKE ? OR price LIKE ? OR quantity LIKE ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, categoryID);
            String searchPattern = "%" + txt + "%";
            st.setString(2, searchPattern);
            st.setString(3, searchPattern);
            st.setString(4, searchPattern);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                list.add(new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getInt("price"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getInt("discount"),
                        rs.getString("status"), c));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //get product by id
    public Product getProductById(String productId) {
        Product product = null;
        String sql = "SELECT * FROM Product WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, productId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID")); // Thay đổi cách lấy category theo nhu cầu
                product = new Product(rs.getString("id"), rs.getString("name"), rs.getInt("price"), rs.getString("image"),
                        rs.getInt("quantity"), rs.getString("description"), rs.getInt("discount"), rs.getString("status"), c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    public static void main(String[] args) {
        DAO d = new DAO();
        List<Product> p = d.getProductByIndex(0, 6);
        for (Product product : p) {
            System.out.println(product.toString());
        }
    }

    public String getPasswordByUserId(String id) {
        String password = null;
        try {
            String strSQL = "SELECT password FROM account WHERE id = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                password = rs.getString("password");
            }
        } catch (SQLException e) {
            System.out.println("getPasswordByUserId: " + e.getMessage());

        }
        return password;
    }

    public int getIdByUsername(String username) {
        int id = 0;
        try {
            String strSQL = "SELECT id FROM account WHERE username = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, username);
            rs = stm.executeQuery();
            if (rs.next()) {
                id = rs.getInt("id");
            }
        } catch (SQLException e) {
            System.out.println("getIdByUsername: " + e.getMessage());
        }
        return id;
    }

    public String getStatusByUserId(int id) {
        String status = null;
        try {
            String strSQL = "SELECT status FROM account WHERE id = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                status = rs.getString("status");
            }
        } catch (SQLException e) {
            System.out.println("getStatusByUserId: " + e.getMessage());
        }
        return status;
    }

    public String getRoleByUserId(int id) {
        String role = null;
        try {
            String strSQL = "SELECT role FROM account WHERE id = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                role = rs.getString("role");
            }
        } catch (SQLException e) {
            System.out.println("getStatusByUserId: " + e.getMessage());
        }
        return role;
    }

    public boolean updateAccountStatus(String userId, String status) {
        String query = "UPDATE account SET status = ?,updated_at = CURRENT_TIMESTAMP WHERE ID = ?";

        try (PreparedStatement statement = cnn.prepareStatement(query)) {
            statement.setString(1, status);
            statement.setString(2, userId);

            int rowsAffected = statement.executeUpdate();

            return rowsAffected > 0; // Returns true if at least one row was updated
        } catch (SQLException ex) {
            ex.printStackTrace();
            // Optionally, log more details or handle specific cases
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("Error Code: " + ex.getErrorCode());
            System.out.println("Message: " + ex.getMessage());
            Throwable t = ex.getCause();
            while (t != null) {
                System.out.println("Cause: " + t);
                t = t.getCause();
            }
        }

        return false;

    }

    public List<Product> getRandom16() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from project1.PRODUCT where id = id ORDER BY RAND( ) LIMIT 16;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getInt("price"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }
    
    public List<Product> getSimilarPrice(String id) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM project1.PRODUCT WHERE price = (SELECT price FROM PRODUCT WHERE id = ?) LIMIT 4;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getInt("price"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }
    
    public List<Product> getSimilarCategory(String id) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM project1.PRODUCT WHERE categoryID = (SELECT categoryID FROM PRODUCT WHERE id = ?) LIMIT 4;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getInt("price"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }
    
    public List<Product> getSuperDeals(String cid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM project1.PRODUCT WHERE discount > 0 AND categoryID = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getInt("price"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

        
        public List<Product> getProductsByID(String id) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from project1.PRODUCT where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rse = st.executeQuery();
            while (rse.next()) {
                Categories c = getCategoryById(rse.getInt("categoryID"));
                Product p = new Product(rse.getString("id"),
                        rse.getString("name"),
                        rse.getInt("price"),
                        rse.getString("image"),
                        rse.getInt("quantity"),
                        rse.getString("description"),
                        rse.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }
        
        public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from project1.PRODUCT where name like ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" +txtSearch + "%");
            ResultSet rse = st.executeQuery();
            while (rse.next()) {
                Categories c = getCategoryById(rse.getInt("categoryID"));
                Product p = new Product(rse.getString("id"),
                        rse.getString("name"),
                        rse.getInt("price"),
                        rse.getString("image"),
                        rse.getInt("quantity"),
                        rse.getString("description"),
                        rse.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }
        
        public Product getProductByID(String id) {
        
        String sql = "select * from project1.PRODUCT where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rse = st.executeQuery();
            while (rse.next()) {
                Categories c = getCategoryById(rse.getInt("categoryID"));
                Product p = new Product(rse.getString("id"),
                        rse.getString("name"),
                        rse.getInt("price"),
                        rse.getString("image"),
                        rse.getInt("quantity"),
                        rse.getString("description"),
                        rse.getInt("discount"),
                        c);
                return p;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
        
        public List<Product> getTop10() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM project1.PRODUCT WHERE discount > 0 ORDER BY discount desc LIMIT 10;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getInt("price"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }


    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String query = "select * from project1.PRODUCT where id = id";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getDouble(8)));
            }
        }
        catch (Exception e) {

        }
        return list;
    }
    
    public List<Product> getProductsSortedByPriceAsc(int offset, int limit) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product ORDER BY price ASC;";
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductsSortedByPriceDesc(int offset, int limit) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product ORDER BY price DESC;";
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductsSortedByNameAsc(int offset, int limit) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product ORDER BY name ASC;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductsByCidForCategory(String categoryId, int limit, int offset) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM PRODUCT WHERE categoryId = ? LIMIT ? OFFSET ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, categoryId);
            ps.setInt(2, limit);
            ps.setInt(3, offset);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductsByCidForCategory1(int categoryId) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM PRODUCT WHERE categoryId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductsSortedByPriceAscForCategory(String categoryId, int limit, int offset) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM PRODUCT WHERE categoryId = ? ORDER BY price ASC LIMIT ? OFFSET ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, categoryId);
            ps.setInt(2, limit);
            ps.setInt(3, offset);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductsSortedByPriceAscForCategory1(int categoryId) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM PRODUCT WHERE categoryId = ? ORDER BY price ASC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductsSortedByPriceDescForCategory(String categoryId, int limit, int offset) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM PRODUCT WHERE categoryId = ? ORDER BY price DESC LIMIT ? OFFSET ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, categoryId);
            ps.setInt(2, limit);
            ps.setInt(3, offset);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductsSortedByPriceDescForCategory1(int categoryId) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM PRODUCT WHERE categoryId = ? ORDER BY price DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductsSortedByNameAscForCategory(String categoryId, int offset, int limit) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM PRODUCT WHERE categoryId = ? ORDER BY name ASC LIMIT ? OFFSET ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, categoryId);
            ps.setInt(2, limit);
            ps.setInt(3, offset);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductsSortedByNameAscForCategory1(int categoryId) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM PRODUCT WHERE categoryId = ? ORDER BY name ASC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categories c = getCategoryById(rs.getInt("categoryID"));
                Product p = new Product(rs.getString("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("image"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getInt("discount"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
  
