/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

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
public class MainController extends HttpServlet {
private static final String ERROR = "errorPage.jsp";
private static final String HOMEPAGE = "HomePage.jsp";
private static final String DASHBOARD = "StaffPage.jsp";
private static final String POST_APPROVEMENT_PAGE = "PostApprovement.jsp";
private static final String USER_MANAGEMENT = "UserManagement.jsp";
private static final String GET_PENDING_POST_CONTROLLER="GetPendingPost";
private static final String SEARCH_USER_CONTROLLER="SearchController";
private static final String UPDATE_USER_STATUS_CONTROLLER = "UpdateUserStatus";
private static final String REGISTER = "RegisterController";
private static final String ADD_STAFF = "AddStaffController";
private static final String GET_ALL_USER_CONTROLLER = "GetAllUserController";
private static final String APPROVE_POST_CONTROLLER="ApprovePostController";
private static final String DECLINE_POST_CONTROLLER="DeclinePostController";
private static final String GET_PENDING_EXCHANGE_CONTROLLER="GetPendingExchange";
private static final String GET_ALL_STAFF_CONTROLLER = "GetAllStaffController";
private static final String UPDATE_ABOUT_US = "UpdateAboutUsController";
private static final String UPDATE_CONTACT = "UpdateContactController";
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
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = HOMEPAGE;
            } else if (action.equals("Register")) {
                url = REGISTER;
            } else if (action.equals("AddStaff")) {
                url = ADD_STAFF;
            }
            else if(action.equals("Search User")){
                url = SEARCH_USER_CONTROLLER;
            }
            else if (action.equals("UserManagement")){
                url = USER_MANAGEMENT;
            }
            else if (action.equals("Update user status")){
                url = UPDATE_USER_STATUS_CONTROLLER;
            }
            else if (action.equals("Get all user")){
                url = GET_ALL_USER_CONTROLLER;
            }
            else if (action.equals("Dashboard")){
                url = DASHBOARD;
            }
            else if (action.equals("PostApprovement")){
                url = GET_PENDING_POST_CONTROLLER;
            }
            else if (action.equals("Approve")){
                url = APPROVE_POST_CONTROLLER;
            }
            else if (action.equals("Decline")){
                url = DECLINE_POST_CONTROLLER;
            }
            else if (action.equals("ExchangeApprovement")){
                url = GET_PENDING_EXCHANGE_CONTROLLER;
            else if (action.equals("Get all staff")){
                url = GET_ALL_STAFF_CONTROLLER;
            }
            else if (action.equals("UpdateAboutUs")){
                url = UPDATE_ABOUT_US;
            }
            else if (action.equals("UpdateContact")){
                url = UPDATE_CONTACT;
            }
        }catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
