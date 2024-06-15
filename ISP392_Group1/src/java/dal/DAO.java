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
        String sql = "UPDATE [dbo].[Account] set [username] = ? ,[password] = ? where [email] = ? ";
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
        String sql = "select * from [dbo].[Account] where email= ? and auth_method = 'google' ";
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
        String sql = "update [dbo].[Account] set password = ? where email=?";
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
        String sql = "select * from [dbo].[ACCOUNT] where email=?";
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

    public static void main(String[] args) {
        DAO d = new DAO();
        List<Product> p = d.getProductByIndex(0, 6);
        for (Product product : p) {
            System.out.println(product.toString());
        }

    }
}
