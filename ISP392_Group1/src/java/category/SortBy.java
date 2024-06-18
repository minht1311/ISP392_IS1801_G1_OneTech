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
import model.Categories;
import model.Product;

/**
 *
 * @author KimHo
 */
@WebServlet(name = "SortBy", urlPatterns = {"/sortby"})
public class SortBy extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SortBy</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortBy at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        DAO d = new DAO();
        String sort = request.getParameter("sort_by");
        String categoryId = request.getParameter("cid");
        int productCount;
        List<Product> list1;
        int endPage = 0;

        if (categoryId == null || categoryId.isEmpty()) {
            // No category selected, show all products
            list1 = d.getProduct();
            productCount = d.countAllProduct();
        } else {
            // Category selected, show products of that category
            list1 = d.getProductsByCid(categoryId);
            productCount = d.countAllProductOfCategory(categoryId);

        }
        endPage = productCount / 12;
        if (productCount % 12 != 0) {
            endPage++;
        }

        List<Product> list = d.getProductsByCid(categoryId);
        List<Categories> listC = d.getCategory();
        // Calculate endPage based on total product count
        if (productCount > 0) {
            endPage = productCount / 12;
            if (productCount % 12 != 0) {
                endPage++;
            }
        }

        int page = 1; // Default page number
        String indexParam = request.getParameter("index");
        if (indexParam != null && !indexParam.isEmpty()) {
            try {
                page = Integer.parseInt(indexParam);
            } catch (NumberFormatException e) {
                // Handle the case where indexParam cannot be parsed to an integer
                // For example, log the error or set a default value for page
                e.printStackTrace(); // Print stack trace for debugging
            }
        }

        int productsPerPage = 12;
        int offset = (page - 1) * productsPerPage;

        List<Product> listP = d.getProductByIndex(offset, productsPerPage);

        // Set attributes to be used in shop.jsp
        request.setAttribute("productsPerPage", productsPerPage);
        request.setAttribute("productCount", productCount);
        request.setAttribute("listP", listP);
        request.setAttribute("endPage", endPage);
        request.setAttribute("listC", listC);

        // Forward the request to shop.jsp for rendering
        request.getRequestDispatcher("shop.jsp").forward(request, response);
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
