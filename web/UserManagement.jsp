<%-- 
    Document   : UserManagement
    Created on : Oct 7, 2023, 3:06:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" class="color-sidebar sidebarcolor3 color-header headercolor5">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            .menuButton{
                border: 0.15;
                background-color: #111314;
                color: white;
                padding: 0 75px;
                border-radius: 13px;
                margin-bottom: 8px;
            }
        </style>
        <title>Manage members</title>
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
                                <button class="menuButton" name="action" value="Dashboard">Dashboard</button>
                                <button class="menuButton" name="action" value="UserManagement">Manage user</button>
                                <button class="menuButton" name="action" value="Post">Post</button>
                                <button class="menuButton" name="action" value="#">Profile</button>
                                <button class="menuButton" name="action" value="Logout">Logout</button>
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
                    <div class="page-content">
                        <h1>User Management</h1>
                                <form action="MainController">
                                    Search User <input type="text" name="txtSearchValue" 
                                                        value="${param.txtSearchValue}" />
                                    <input type="submit" value="Search User" name="action" />
                                </form> <br>
                    </div>
                    <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="">
                                        <div class="table-responsive">
                                            <c:set var="searchValue" value="${param.txtSearchValue}"/>
                                            <c:if test="${not empty searchValue}">
                                                <c:set var="result" value ="${requestScope.SEARCH_RESULT}"/>
                                                <c:if test="${not empty result}">
                                            <table  class="table project-list-table table-nowrap align-middle table-borderless">
                                                <thead style="background-color: green; color: white;">
                                                    <tr>
                                                        <th scope="col" class="ps-4" style="width: 50px;">

                                                        </th>
                                                        <th scope="col">Username</th>
                                                        <th scope="col">Email</th>
                                                        <th scope="col">Phone number</th>
                                                        <th scope="col">address</th>
                                                        <th scope="col">Points</th>
                                                        <th scope="col">Status</th>
                                                        <th scope="col" style="width: 200px;">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${result}" var="dto" varStatus="counter">
                                                        <form action="MainController" method="POST">
                                                    <tr>
                                                        <th scope="row" class="ps-4">
                                                            <div class="form-check font-size-16"><input type="checkbox" class="form-check-input" id="contacusercheck9" /><label class="form-check-label" for="contacusercheck9"></label></div>
                                                        </th>
                                                        <td><a href="#" class="text-body">${dto.username}</a></td>
                                                        <td>${dto.email}</td>
                                                        <td>${dto.phone}</td>
                                                        <td>${dto.address}</td>
                                                        <td>${dto.point}</td>
                                                        <td>
                                                            <select name="txtStatus">
                                                                                    <option ${(dto.status) ?  "selected": ""} value="true">Active</option>
                                                                                    <option ${(not dto.status) ?  "selected": ""} value="false">BAN</option>
                                                                                </select>
                                                        </td>
                                                        <td>
                                                            <input type="hidden" name="txtID" value="${dto.userId}" />
                                                            <input type="hidden"  name="lastSearchValue" value="${searchValue}"/>
                                                                                <input type="submit" value="Update user status" name="action" />
                                                        </td>
                                                    </tr>
                                                        </form>
                                                        </c:forEach>
                                                </tbody>
                                            </table>
                                            </c:if>
                                                <c:if test="${empty result}">

                                                </c:if>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
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