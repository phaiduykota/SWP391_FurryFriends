/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Post;

import DAO.CategoryDAO;
import DAO.PostDAO;
import DAO.PostTypeDAO;
import Model.Category;
import Model.Constant;
import Model.Post;
import Model.PostType;
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
public class ListPostController extends HttpServlet {

    private int recordsPerPage = 5;
    private String textSearch = null;
    private int categoryId = -1;
    private int typeId = -1;
    private int status = -1;
    private int isPublic = -1;

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListPostController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListPostController at " + request.getContextPath() + "</h1>");
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
        if (request.getSession().getAttribute("account") == null) {
            request.getSession().setAttribute("msg", "Bạn cần đăng nhập để sử dụng tính năng này!");
            response.sendRedirect("home");
        } else {
            User account = (User) request.getSession().getAttribute("account");

            PostDAO pDao = new PostDAO();

            //pagenition 
            int page = 1;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(
                        request.getParameter("page"));
            }

            //search by text
            if (textSearch == null) {
                textSearch = "";
            }

            ArrayList<Post> posts = pDao.GetPostByUser((page - 1) * recordsPerPage,
                    recordsPerPage, account.getUserId(), textSearch, categoryId,
                    typeId, status, isPublic);

            int noOfRecords = pDao.GetNoOfRecordsPostByUser(account.getUserId(), textSearch, categoryId,
                    typeId, status, isPublic);

            int noOfPages = (int) Math.ceil((double) noOfRecords
                    / recordsPerPage);

            CategoryDAO cDao = new CategoryDAO();
            PostTypeDAO ptDao = new PostTypeDAO();

            //get all category post
            ArrayList<Category> categories = cDao.GetAllCategories();

            //get all post type
            ArrayList<PostType> types = ptDao.GetAllPostType();

            request.setAttribute("types", types);
            request.setAttribute("categories", categories);

            request.setAttribute("typeId", typeId);
            request.setAttribute("categoryId", categoryId);
            request.setAttribute("textSearch", textSearch);

            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);
            request.setAttribute("noOfRecords", noOfRecords);

            request.setAttribute("posts", posts);

            request.getRequestDispatcher("/Views/Post/ListPost.jsp").forward(request, response);
        }
    }

    public static void main(String[] args) {
        PostDAO pDao = new PostDAO();
        ArrayList<Post> posts = pDao.GetPostByUser(0,
                3, 3, "", -1, -1, -1, -1);
        System.out.println(posts.size());
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
        String action = request.getParameter("action");
        switch (action) {
            case "search":
                textSearch = request.getParameter("textSearch");
                categoryId = Integer.parseInt(request.getParameter("categorySearch"));
                typeId = Integer.parseInt(request.getParameter("typeSearch"));
                doGet(request, response);
                break;
        }
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
