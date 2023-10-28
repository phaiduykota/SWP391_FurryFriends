<%-- 
    Document   : statisticsPage
    Created on : Oct 28, 2023, 11:27:52 AM
    Author     : DUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.InformationDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Statistics Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 0;
            }

            h1 {
                text-align: center;
                background-color: #ff9933;
                color: #fff;
                padding: 10px;
                margin: 0;
            }

            #menu {
                background-color: #ff9933;
                color: #fff;
                padding: 10px;
            }

            ul {
                list-style: none;
                padding: 0;
                text-align: center;
                margin-left: 0;
            }

            li {
                display: inline;
                margin-right: 20px;
            }

            a {
                text-decoration: none;
                color: #fff;
            }

            a:hover {
                text-decoration: underline;
            }

            #content {
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 20px;
            }

            h2 {
                background-color: #fff;
                color: #333;
                padding: 10px;
                font-family: Arial, sans-serif;
                border-bottom: 1px solid #ccc;
            }
        </style>
    </head>
    <body>
        <h1>Admin Management</h1>
        <div id="menu">
            <ul>
                <li><a href="statisticsPage.jsp">Thống kê</a></li>
                <li><a href="configPage.jsp">Cấu hình hệ thống</a></li>
                <li><a href="addStaff.jsp">Thêm mới quản trị viên</a></li>
                <li><a href="staffManagement.jsp">Quản lí quản trị viên</a></li>
            </ul>
        </div>
        <div>
            <h2>Thành viên</h2>
            Số lượng người dùng: 
            <%
            try {
                InformationDAO dao = new InformationDAO();
                int userCount = dao.countUsers();
                out.println(userCount);
            } catch (Exception e) {
                e.printStackTrace();
                out.println("N/A");
            }
            %> (Có 
            <%
            try {
                InformationDAO dao = new InformationDAO();
                int userCount = dao.countBannedUsers();
                out.println(userCount);
            } catch (Exception e) {
                e.printStackTrace();
                out.println("N/A");
            }
            %> người dùng hiện đang bị cấm)<br>
            Số lượng quản trị viên: 
            <%
            try {
                InformationDAO dao = new InformationDAO();
                int staffCount = dao.countStaffs();
                out.println(staffCount);
            } catch (Exception e) {
                e.printStackTrace();
                out.println("N/A");
            }
            %> (Có 
            <%
            try {
                InformationDAO dao = new InformationDAO();
                int staffCount = dao.countInactiveStaffs();
                out.println(staffCount);
            } catch (Exception e) {
                e.printStackTrace();
                out.println("N/A");
            }
            %> quản trị viên hiện đang dừng hoạt động)<br>
        </div>
        <div>
            <h2>Bài đăng</h2>
            Số lượng bài viết:
            <%
            try {
                InformationDAO dao = new InformationDAO();
                int postCount = dao.countPosts();
                out.println(postCount);
            } catch (Exception e) {
                e.printStackTrace();
                out.println("N/A");
            }
            %><br>
        </div>
    </body>
</html>
