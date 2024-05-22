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

/**
 *
 * @author KimHo
 */
public class DAO extends DBContext {

    // tao tai khoan
    public void add(Account a) {
        String sql = "insert into [dbo].[Account] (username, email, password, auth_method) values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getEmail());
            st.setString(3, a.getPassword());
            st.setString(4, "local");
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
        String sql = "select * from [dbo].[Account] where username=?";
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
            String strSQL = "select * from account where username = ? and password = ?";
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
            String strSQL = "select * from account where username = ? and password = email";
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
            String strSQL = "SELECT username, password, email FROM account WHERE email = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, email);
            rs = stm.executeQuery();
            if (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                String userEmail = rs.getString("email");
                account = new Account(username, userEmail, password);
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

}
