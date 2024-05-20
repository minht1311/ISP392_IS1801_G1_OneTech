/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;


import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.account;
import java.sql.ResultSet;
/**
 *
 * @author KimHo
 */
public class DAO extends DBContext {
    // tao tai khoan
    public void add(account a) {
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
    
}
