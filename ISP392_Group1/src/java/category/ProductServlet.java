/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package category;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Product;

/**
 *
 * @author KimHo
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/ProductServlet"})
public class ProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int page = Integer.parseInt(request.getParameter("page"));
        int productsPerPage = 12; 
        int offset = (page - 1) * productsPerPage;
        PrintWriter out = response.getWriter();
        DAO d = new DAO();
        List<Product> listP = d.getProductByIndex(offset, productsPerPage);

        for (Product p : listP) {
            out.println("                                          <div class=\"product col-md-3\">\n"
                    + "                                                <div class=\"product-card\">\n"
                    + "                                                    <div class=\"product_image d-flex flex-column align-items-center justify-content-center\">\n"
                    + "                                                        <img src=\""+p.getImage()+"\" alt=\"\">\n"
                    + "                                                    </div>\n"
                    + "                                                    <div class=\"product-info\">\n"
                    + "                                                        <div class=\"product_price\">\n"
                    + "                                                            <h3>"+p.getFormattedPrice()+"</h3> \n"
                    + "                                                        </div>\n"
                    + "\n"
                    + "                                                        <div class=\"product_name\">\n"
                    + "                                                            <div class=\"name_cart_container d-flex justify-content-between align-items-center\">\n"
                    + "                                                                <a href=\"#\">"+p.getName()+"</a>\n"
                    + "                                                                <p class=\"cart_icon\">\n"
                    + "                                                                    <a href=\"#\">\n"
                    + "                                                                        <i class=\"fas fa-shopping-cart\"></i>\n"
                    + "                                                                    </a>\n"
                    + "                                                                </p>\n"
                    + "                                                            </div>\n"
                    + "                                                        </div>\n"
                    + "                                                    </div>\n"
                    + "                                                </div>\n"
                    + "                                            </div>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
