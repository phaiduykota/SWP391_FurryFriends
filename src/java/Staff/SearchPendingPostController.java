/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Staff;

import DAO.PostDAO;
import DAO.PostTypeDAO;
import Model.Post;
import Model.PostType;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class SearchPendingPostController extends HttpServlet {
   private final String ERROR_PAGE="errorPage.jsp";
   private final String RESULT_PAGE="SearchPendingPostPage.jsp";
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
        String searchValue = request.getParameter("txtSearchValue");
        int postTypeId = Integer.parseInt(request.getParameter("postTypeId"));
        PostTypeDAO ptDao = new PostTypeDAO();
        PostDAO pDao = new PostDAO();
        HttpSession session = request.getSession();
        ArrayList<PostType> listType = ptDao.GetPostTypeForSearchPost();
        String url = ERROR_PAGE;
        try  {
            if (!searchValue.trim().isEmpty()){
                if(postTypeId== 0){
                    pDao.searchPostByTitle(searchValue);
                }
                else {
                    pDao.searchPostByTitleAndType(searchValue, postTypeId);
                }
                List<Post> result = pDao.getPostSearchResult();
                session.setAttribute("types", listType);
                request.setAttribute("SEARCH_POST_RESULT", result);
                url = RESULT_PAGE;
            }
            if(searchValue.isEmpty()){
                if(postTypeId== 0){
                    url = "GetPendingPost";
                }
                else {
                    pDao.searchPostByType(postTypeId);
                    List<Post> result = pDao.getPostSearchResult();
                    session.setAttribute("types", listType);
                    request.setAttribute("SEARCH_POST_RESULT", result);
                    url = RESULT_PAGE;
                }
            }
        } catch (ClassNotFoundException ex) {
           Logger.getLogger(SearchPendingPostController.class.getName()).log(Level.SEVERE, null, ex);
       } catch (SQLException ex) {
           Logger.getLogger(SearchPendingPostController.class.getName()).log(Level.SEVERE, null, ex);
       } catch (NamingException ex) {
           Logger.getLogger(SearchPendingPostController.class.getName()).log(Level.SEVERE, null, ex);
       }finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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