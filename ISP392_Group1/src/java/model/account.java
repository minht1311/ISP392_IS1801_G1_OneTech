/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author KimHo
 */
public class account {
    String username, email, password, auth_method, code;

    public account() {
    }

    public account(String username, String email, String password, String auth_method, String code) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.auth_method = auth_method;
        this.code = code;
    }

    public account(String username, String email, String password, String code) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.code = code;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAuth_method() {
        return auth_method;
    }

    public void setAuth_method(String auth_method) {
        this.auth_method = auth_method;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }


    
    
}
