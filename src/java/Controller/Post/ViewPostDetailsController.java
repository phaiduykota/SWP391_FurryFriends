/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Post;

import DAO.CommentDAO;
import DAO.LikePostDAO;
import DAO.PostDAO;
import DAO.ReportContentDAO;
import Model.Comment;
import Model.InterestedPost;
import Model.Post;
import Model.ReportContent;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author dell
 */
public class ViewPostDetailsController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("postId"));
        PostDAO pDao = new PostDAO();
        Post p = pDao.GetPostById(postId);
        if (p == null) {
            request.getSession().setAttribute("msg", "Bài viết hiện không khả thi!");
            response.sendRedirect("home");
        } else {
            LikePostDAO lpDao = new LikePostDAO();
            int totalLike = lpDao.GetTotalLikePost(p.getPostId());
            
            CommentDAO cDao = new CommentDAO();
            ArrayList<Comment> comments = cDao.GetCommentByPostId(postId);
            
            
            ArrayList<InterestedPost> listUI = pDao.GetUserInterested(p.getPostId());
            p.setUserInterested(listUI);
            
            ArrayList<User> listUL = pDao.GetUserLike(p.getPostId());
            p.setUserLike(listUL);
            
            ArrayList<User> listUS = pDao.GetUserSave(p.getPostId());
            p.setUserSave(listUS);
            for (Comment comment : comments) {
                ArrayList<Comment> commentChild = cDao.getCommentChildById(comment.getCommentId());
                comment.setChildrens(commentChild);
            }
            
            ReportContentDAO rpDao = new ReportContentDAO();
            ArrayList<ReportContent> reports = rpDao.GetListReportContent();
            
            p.setComments(comments);
            
            request.setAttribute("reports", reports);
            request.setAttribute("totalLike", totalLike);
            request.setAttribute("post", p);
            request.getRequestDispatcher("Views/Post/ViewPostDetails.jsp").forward(request, response);
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
