/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Staff;

import DAO.PostDAO;
import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class UpdateUserStatus extends HttpServlet {
   private final String ERROR_PAGE = "errorPage.jsp";
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
        int userId = Integer.parseInt(request.getParameter("txtID"));
        boolean status = Boolean.parseBoolean(request.getParameter("txtStatus"));
        String searchValue = request.getParameter("lastSearchValue");
        String urlRewriting = ERROR_PAGE;
        try {
            
            UserDAO dao = new UserDAO();
            PostDAO pDao = new PostDAO();
            if(status == false){
                boolean result = dao.UpdateUserStatus(userId, status);
                boolean hideAllUserPost = pDao.UpdateUserPostIsPublic(userId, false);
                if (result && hideAllUserPost) {
                    urlRewriting = "GetAllUserController";
                }
            }
            if(status == true){
                boolean result = dao.UpdateUserStatus(userId, status);
                boolean PublicAllUserPost = pDao.UpdateUserPostIsPublic(userId, true);
                if (result && PublicAllUserPost) {
                    urlRewriting = "GetAllUserController";
                }
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            
            response.sendRedirect(urlRewriting);
        }
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
