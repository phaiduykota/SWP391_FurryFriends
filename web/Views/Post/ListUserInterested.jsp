<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    </head>

    <body>

        <%@ include file="../../asset/includes/User/HeaderUser.jsp" %>
        <%@ include file="../../asset/includes/User/NavbarUser.jsp" %>
        <!-- Dashboard Products wrapper -->
        <section style="margin-left: 280px; height: calc(100vh - 133px); overflow-y: auto;">
            <div class="p-4" style="margin-bottom: 42px;">
                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Bài biết của tôi</h1>
                </div>

                <!-- Content Row -->
                <div class="row">
                    <div class="table-responsive">
                        <table class="table align-middle">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Ảnh</th>
                                    <th>Tiêu đề bài viết</th>
                                    <th>Phân loại bài viết</th>
                                    <th>Chế độ bài viết</th>
                                    <th>Trạng thái bài viết</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${posts}" var="p">
                                    <tr>
                                        <td>${p.postId}</td>
                                        <td>
                                            <img src="${p.img}" alt="alt" width="80px" height="80px" style="background-size: cover"/>
                                        </td>
                                        <td>${p.title}</td>
                                        <td>${p.postType.postTypeName}</td>
                                        <td>
                                            <c:if test="${p.isPublic == true}">
                                                Công khai
                                            </c:if>
                                            <c:if test="${p.isPublic == false}">
                                                Riêng tư
                                            </c:if>
                                        </td>
                                        <td>${p.status.postStatusValue}</td>
                                        <td>
                                            <div class="d-flex">
                                                <button href="/admin-product-detail.html" type="button"
                                                        class="btn btn-outline-success me-2" data-bs-toggle="modal"
                                                        data-bs-target="#itemDetail_${p.postId}">
                                                    <i class="fa-solid fa-eye"></i>
                                                </button>
                                                <!--Modal View Detail-->
                                                <div class="modal fade" id="itemDetail_${p.postId}" tabindex="-1"
                                                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-lg modal-dialog-centered">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Chi tiết</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                        aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="row">
                                                                    <div class="table-responsive">
                                                                        <table class="table align-middle">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>Ảnh</th>
                                                                                    <th>Email</th>
                                                                                    <th>Số điện thoại</th>
                                                                                    <th>Trạng thái</th>
                                                                                    <th>Hành động</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <c:forEach items="${p.userInterested}" var="ui">
                                                                                    <tr>
                                                                                        <td><img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-1.webp"
                                                                                                 alt="Generic placeholder image" class="img-fluid img-thumbnail mt-4 mb-2"
                                                                                                 style="width: 150px; z-index: 1"></td>

                                                                                        <td>${ui.email}</td>
                                                                                        <td>${ui.phone}</td>
                                                                                        <td>
                                                                                            <c:if test="${ui.status == true}">
                                                                                                Hoạt động
                                                                                            </c:if>
                                                                                            <c:if test="${ui.status == false}">
                                                                                                Vô hiệu hóa
                                                                                            </c:if>
                                                                                        </td>
                                                                                        <td>
                                                                                            <c:if test="${ui.status == true}">
                                                                                                <a href="https://zalo.me/${ui.phone}" class="btn btn-outline-primary d-flex align-items-center g-3" role="button">
                                                                                                    <img src="/img/home/zalo.png"
                                                                                                         alt="Generic placeholder image" class="img-fluid img-thumbnail"
                                                                                                         style="width: 40px;height: 40; z-index: 1">Nhắn tin
                                                                                                </a>
                                                                                            </c:if>
                                                                                        </td>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                                        Đóng
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-center mt-1">
                <nav aria-label="Page navigation example col-12">
                    <ul class="pagination">
                        <%--For displaying Previous link except for the 1st page --%>
                        <c:if test="${currentPage != 1}">
                            <li class="page-item">
                                <a class="page-link" href="listUserInterested?page=${currentPage - 1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <%--For displaying Page numbers. The when condition does not display
                                    a link for the current page--%>
                        <c:forEach begin="1" end="${noOfPages}" var="i">
                            <c:choose>
                                <c:when test="${currentPage eq i}"> 
                                    <li class="page-item"><a class="page-link bg-light" href="#">${i}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="listUserInterested?page=${i}">${i}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                        <%--For displaying Next link --%>
                        <c:if test="${currentPage lt noOfPages}">
                            <li class="page-item">
                                <a class="page-link" href="listUserInterested?page=${currentPage + 1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </section>

        <%@ include file="../../asset/includes/User/FooterUser.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </body>

</html>