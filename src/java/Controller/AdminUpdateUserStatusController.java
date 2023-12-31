/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.PostDAO;
import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author DUY
 */
@WebServlet(name = "AdminUpdateUserStatusController", urlPatterns = {"/AdminUpdateUserStatusController"})
public class AdminUpdateUserStatusController extends HttpServlet {
    
    private static final String ERROR = "errorPage.jsp";
    private static final String SUCCESS = "MainController?action=AdminGetAllUser";

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
        String url = ERROR;
        String urlRewriting;
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean status = Boolean.parseBoolean(request.getParameter("status"));
            UserDAO dao = new UserDAO();
            PostDAO pDao = new PostDAO();
            if (status == true ){
                boolean check = dao.UpdateUserStatus(id, status);
                boolean PublicAllUserPost = pDao.UpdateUserPostIsPublic(id, true);
                if(check && PublicAllUserPost){
                    url = SUCCESS;
                }
            }
            if (status == false ){
                boolean check = dao.UpdateUserStatus(id, status);
                boolean hideAllUserPost = pDao.UpdateUserPostIsPublic(id, false);
                if(check && hideAllUserPost){
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            log("Error at AdminUpdateUserStatusController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
