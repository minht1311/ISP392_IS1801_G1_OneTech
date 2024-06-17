/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Categories;
import model.Product;

/**
 *
 * @author MTTRBLX
 */
public class SearchControl extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String txtSearch = request.getParameter("txt");
        DAO dao = new DAO();
        
        List<Product> listP = dao.getRandom16();
        List<Product> listP2 = dao.getRandom16();
        List<Product> listP3 = dao.getRandom16();
        List<Product> listSearch = dao.searchByName(txtSearch);
        List<Product> listP4 = dao.getRandom16();
        List<Product> listTop3 = dao.getProductByIndex(4,3);
        Product p = dao.getProductByID("vcoin100");
        
        List<Categories> listC = dao.getCategory();
        
        request.setAttribute("listP", listP);
        request.setAttribute("listP2", listP2);
        request.setAttribute("listP3", listP3);
        request.setAttribute("listSearch", listSearch);
        request.setAttribute("listP4", listP4);
        request.setAttribute("product", p);
        request.setAttribute("listTop3", listTop3);
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
