<%-- 
    Document   : ViewPendingPostDetail
    Created on : Nov 2, 2023, 1:12:40 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="DAO.InformationDAO" %>
<%@ page import="Model.Information" %>
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
        <script>
            function validate() {
                var reason = document.getElementById('declineReason').value;
                if (reason == "") {
                    alert("Hãy chọn một lý do");
                    return false;
                } else {
                    return true;
                }
            }
        </script>
        <style>
            .detail-img-box{
                height: 100%;
                border: 1px solid;
                width: 100%;
                border-radius: 5px;
                object-fit: cover;
            }
            .pending-post-detail-title{
                font-size: 36px;
                font-weight: 700;
                margin-bottom: 20px;
                margin-top: 30px;
            }
        </style>
        <title>Chi tiết bài viết</title>
    </head>
    <c:if test="${sessionScope.account == null}">
        <c:redirect url="loginPage.jsp"></c:redirect>
    </c:if>

    <c:if test="${not empty sessionScope.account and sessionScope.account.role.roleId ne 2}">
        <!-- Người dùng đã đăng nhập nhưng không phải là ADMIN -->
        <h1>Bạn không có quyền truy cập trang web này.</h1>
        <c:redirect url="HomePage.jsp"></c:redirect>
    </c:if>

    <body>
        <div class="wrapper">
            <!--sidebar wrapper -->
            <div class="sidebar-wrapper" data-simplebar="true">
                <div class="sidebar-header">
                    <%
        try {
            Information info = InformationDAO.getInfor();
                    %>
                    <div>
                        <%
    String logoPath = (info.getLogoPath() != null) ? info.getLogoPath() : "${pageContext.request.contextPath}/asset/img/furryfriends-1.png";
                        %>
                        <img class="rounded-circle" src="<%= logoPath %>" alt="" width="42px" height="42px">
                    </div>
                    <%
} catch (Exception e) {
e.printStackTrace();
}
                    %>
                    <div style="margin-left: 15px">
                        <h4 class="logo-text">Furry Friends</h4>
                    </div>
                </div>
                <!--navigation-->
                <ul class="metismenu" id="menu">
                    <form action="MainController">
                        <!--                        <button class="menuButton" name="action" value="Dashboard">Thống kê</button><br/>
                                                <button class="menuButton" name="action" value="Get all user">Quản lí người dùng</button><br/>
                                                <button class="selected-button" name="action" value="PostApprovement">Bài viết</button><br/>
                                                <button class="menuButton" name="action" value="ExchangeApprovement">Bài trao đổi</button><br/>
                                                <button class="menuButton" name="action" value="Get Reported Post">Báo cáo từ người dùng</button><br/>
                                                <button class="menuButton" name="action" value="#">Thông tin cá nhân</button><br/>
                                                <button class="menuButton" name="action" value="Logout">Đăng xuất</button><br/>-->
                        <a href="viewStatisticController">Thống kê</a>
                        <a href="GetAllUserController">Quản lí người dùng</a>
                        <a style="background: #ff9907"  href="GetPendingPost">Bài viết</a>
                        <a href="GetPendingExchange">Bài trao đổi</a>
                        <a href="GetReportedPost">Báo cáo từ người dùng</a>
                        <a href="logout">Đăng xuất</a>
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

                                <div class="user-info ps-3">
                                    <c:if test="${sessionScope.account != null}">
                                        <p class="user-name mb-0">Hello ${sessionScope.account.username}</p>
                                    </c:if>
                                </div>
                            </a>
                        </div>
                    </nav>
                </div>
            </header>
            <!--end header -->
            <!--Start page-wrapper -->
            <div class="page-wrapper">
                <form action="GetPendingPost">
                    <button class="return-button">Quay lại</button>
                </form>
                <div class="post-style">
                    <c:set var="p" value ="${requestScope.POST}"/>
                    <c:if test="${not empty p.img}">
                        <img src="${p.img}" class="detail-img-box"> <br>         
                    </c:if>
                    <!--                            <div>
                                                                <h5 style="color: #ff9e00">${p.postType.postTypeName}</h5>
                                                </div>-->
                    <h4 class="pending-post-detail-title">${p.title}</h4>
                    <h6 style="color: coral;">${p.postType.postTypeName} <c:if test="${not empty p.category.categoryName}"> : ${p.category.categoryName}</c:if></h6>
                    <div style="display: flex; justify-content: space-between;">
                        <div style="display: flex">
                            <div class="d-flex">
                                <img width="42" height="42" src="${pageContext.request.contextPath}/asset/img/paw.png" alt="">
                            </div>
                            <div style="margin-left: 15px">
                                <h6>${p.user.username}</h6>
                                <p>${p.datePost}</p>
                            </div>
                        </div>
                    </div>
                    <p>${p.content}</p>
                    <form action="MainController" method="POST">
                        <input type="hidden" name="postId" value="${p.postId}">
                        <input type="hidden" name="postTypeId" value="${p.postType.postTypeId}">
                        <button class="approve-button" name="action" value="Approve">Chấp nhận</button>
                    </form><br>
                    <form name="declineform" action="MainController" onsubmit="return validate()" method="POST">
                        <!--                            <button class="decline-button" name="action" value="Decline">Từ chối</button>-->
                        <!--                            <input class="search-User-box" type="text" name="declineReason" value="" placeholder="Lý do từ chối" required=""><br>-->
                        <select class="search-User-box" name="declineReason" id="declineReason">
                            <option value="">Chọn một lý do</option>
                            <option value="Nội dung tiêu cực">Nội dung tiêu cực</option>
                            <option value="Từ ngữ không phù hợp">Từ ngữ không phù hợp</option>
                            <option value="Ảnh không phù hợp">Ảnh không phù hợp</option>
                            <option value="Bài viết trùng lặp">Bài viết trùng lặp</option>
                            <option value="Sai chuyên mục">Sai chuyên mục</option>
                            <input class="decline-button" type="submit" name="action" value="Từ chối">
                        </select>
                        <input type="hidden" name="postTypeId" value="${e.post.postType.postTypeId}">
                        <input type="hidden" name="postId" value="${p.postId}">
                        <input type="hidden" name="postTypeId" value="${p.postType.postTypeId}">
                    </form>
                </div>
            </div>
            <!--end page-wrapper -->
        </div>
    </body>
</html>
