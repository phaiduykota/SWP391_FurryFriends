<%-- 
    Document   : PostApprovement
    Created on : Oct 15, 2023, 11:49:34 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" class="color-sidebar sidebarcolor3 color-header headercolor5">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="asset/staff-page/css/pace.min.css" rel="stylesheet" />
        <script src="asset/staff-page/js/pace.min.js"></script>

        <link href="asset/staff-page/css/bootstrap.min.css" rel="stylesheet">
        <link href="asset/staff-page/css/bootstrap-extended.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
        <link href="asset/staff-page/css/app.css" rel="stylesheet">
        <link href="asset/staff-page/css/icons.css" rel="stylesheet">

        <link rel="stylesheet" href="asset/staff-page/css/dark-theme.css" />
        <link rel="stylesheet" href="asset/staff-page/css/semi-dark.css" />
        <link rel="stylesheet" href="asset/staff-page/css/header-colors.css" />
        <style type="text/css">
            .selected-button{
                width: 100%;
                background-color: #ff9907;
                color: white;
                margin-bottom: 8px;
                font-size: larger;
                border: 0;
            }
            .menuButton{
                width: 100%;
                background-color: #171717;
                color: white;
                margin-bottom: 8px;
                font-size: larger;
                border: 0;
            }
            .search-User-box{
                width: 330px;
                height: 36px;
                border-radius: 4px;
                padding-left: 13px;
            }
            .post-style{
                background: white;
                margin-left: 100px;
                padding: 21px;
                border-radius: 10px;
                margin-right: 100px;
                margin-bottom: 50px;
            }
            .approve-button{
                margin-top: 10px;
                font-size: large;
                border: 0;
                border-radius: 5px;
                background: #30ff3c;
                color: white;
                padding: 5px;
            }
            .decline-button{
                margin-top: 10px;
                font-size: large;
                border: 0;
                border-radius: 5px;
                background: #ff3030;
                color: white;
                padding: 5px;
            }
        </style>
        <title>Duyệt bài viết</title>
    </head>
    <body>
        <div class="wrapper">
            <!--sidebar wrapper -->
            <div class="sidebar-wrapper" data-simplebar="true">
                <div class="sidebar-header">
                    <div>
                        <img src="asset/images/logo-icon.png" class="logo-icon" alt="logo icon">
                    </div>
                    <div>
                        <h4 class="logo-text">Furry Friends</h4>
                    </div>
                    <div class="toggle-icon ms-auto"><i class='bx bx-first-page'></i>
                    </div>
                </div>
                <!--navigation-->
                <ul class="metismenu" id="menu">
                    <form action="MainController">
                        <button class="menuButton" name="action" value="Dashboard">Thống kê</button><br/>
                        <button class="menuButton" name="action" value="Get all user">Quản lí người dùng</button><br/>
                        <button class="selected-button" name="action" value="PostApprovement">Bài viết</button><br/>
                        <button class="menuButton" name="action" value="ExchangeApprovement">Bài trao đổi</button><br/>
                        <button class="menuButton" name="action" value="#">Thông tin cá nhân</button><br/>
                        <button class="menuButton" name="action" value="Logout">Đăng xuất</button><br/>
                    </form>		
                </ul>
                <!--end navigation-->
            </div>
            <!--end sidebar wrapper -->
            <!--start header -->
            <header>
                <div class="topbar d-flex align-items-center">
                                            <nav class="navbar navbar-expand">
                                                <div class="user-box dropdown">
                                                                    <a class="d-flex align-items-center nav-link dropdown-toggle dropdown-toggle-nocaret" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                                            <img src="assets/images/avatars/avatar-2.png" class="user-img" alt="user avatar">
                                                                            <div class="user-info ps-3">
                                                                                    <p class="user-name mb-0">Hello #</p>
                                                                            </div>
                                                                    </a>
                                                            </div>
                                            </nav>
                </div>
            </header>
            <!--end header -->
            <!--Start page-wrapper -->
            <div class="page-wrapper">
                <c:set var="result" value ="${requestScope.PENDING_LIST}"/>
                <c:forEach items="${result}" var="p" varStatus="counter">

                    <div class="post-style">
                        <table>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="d-flex">
                                            <img width="42" height="42" src="asset/img/blog/user-img.png" alt="">
                                        </div>
                                    </td>
                                    <td>
                                        <h5>${p.user.username}</h5>
                                        <p>${p.datePost}</p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <h6>${p.title}</h6>
                        <p>${p.content}</p>
                        <c:if test="${not empty p.img}">
                            <img class="img-fluid" src="${p.img}" alt="" width="800px" height="300px"> <br>         
                        </c:if>
                        <form action="MainController" method="GET">
                            <input type="hidden" name="postId" value="${p.postId}">
                            <button class="approve-button" name="action" value="Approve">Approve</button>
                        </form><br>
                        <form action="MainController" method="GET">
                            <button class="decline-button" name="action" value="Decline">Decline</button>
                            <input class="search-User-box" type="text" name="declineReason" value="" placeholder="Lý do từ chối" required=""><br>
                            <input type="hidden" name="postId" value="${p.postId}">

                        </form>
                    </div>
                </c:forEach>
            </div>
            <!--end page-wrapper -->

        </div>
        <!--end wrapper-->
        <!-- Bootstrap JS -->
        <script src="asset/staff-page/js/bootstrap.bundle.min.js"></script>
        <!--plugins-->
        <script src="asset/staff-page/js/jquery.min.js"></script>
        <script src="asset/staff-page/plugins/simplebar/js/simplebar.min.js"></script>
        <script src="asset/staff-page/plugins/metismenu/js/metisMenu.min.js"></script>
        <script src="asset/staff-page/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
        <script src="asset/staff-page/plugins/apexcharts-bundle/js/apexcharts.min.js"></script>
        <script src="asset/staff-page/js/index5.js"></script>
        <!--app JS-->
        <script src="asset/staff-page/js/app.js"></script>
    </body>
</html>