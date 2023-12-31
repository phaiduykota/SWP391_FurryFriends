<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh sách bài viết của tôi</title>
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
                    <h1 class="h3 mb-0 text-gray-800">Bài viết của tôi</h1>
                </div>

                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <form action="listPost" method="post">
                        <input type="hidden" name="action" value="search">
                        <div class="d-flex gap-3">
                            <input class="form-control" type="text" name="textSearch" value="${textSearch}">
                            <select class="form-control" name="categorySearch">
                                <option value="-1">Tất cả phân loại</option>
                                <c:forEach items="${categories}" var="c">
                                    <option 
                                        <c:if test="${c.categoryId == categoryId}">
                                            selected
                                        </c:if>
                                        value="${c.categoryId}">${c.categoryName}</option>
                                </c:forEach>
                            </select>
                            <select class="form-control" name="typeSearch">
                                <option value="-1">Tất cả danh mục</option>
                                <c:forEach items="${types}" var="t">
                                    <option value="${t.postTypeId}"
                                            <c:if test="${t.postTypeId  == typeId}">
                                                selected
                                            </c:if>
                                            >${t.postTypeName}</option>
                                </c:forEach>
                            </select>
                            <button class="btn btn-outline-info" type="submit">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                        </div>
                    </form>
                </div>

                <!-- Content Row -->
                <div class="row">
                    <div class="table-responsive">
                        <table class="table align-middle">
                            <thead>
                                <tr>

                                    <th>Ảnh</th>
                                    <th>Tiêu đề bài viết</th>
                                    <th>Danh mục bài viết</th>
                                    <th>Phân loại</th>
                                    <th>Chế độ bài viết</th>
                                    <th>Trạng thái bài viết</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${posts}" var="p">
                                    <tr>

                                        <td>
                                            <img src="${p.img}" alt="alt" width="80px" height="80px" style="background-size: cover; object-fit: cover"/>
                                        </td>
                                        <td>${p.title}</td>
                                        <td>${p.postType.postTypeName}</td>
                                        <td>${p.category.categoryName}</td>
                                        <td>
                                            <c:if test="${p.isPublic == true}">
                                                Công khai
                                            </c:if>
                                            <c:if test="${p.isPublic == false}">
                                                Riêng tư
                                            </c:if>
                                        </td>
                                        <td>
                                            <c:if test="${p.status.postStatusId == 1}">
                                                <p style="background: gold; color: white ; text-align: center; padding: 5px; border-radius: 35px; width: 135px"> 
                                                </c:if>
                                                <c:if test="${p.status.postStatusId == 3}">
                                                <p style="background: red; color: white ; text-align: center; padding: 5px; border-radius: 35px; width: 135px"> 
                                                </c:if>
                                                <c:if test="${p.status.postStatusId == 2}">
                                                <p style="background: green; color: white ; text-align: center; padding: 5px; border-radius: 35px; width: 135px"> 
                                                </c:if>
                                                <c:if test="${p.status.postStatusId == 4}">
                                                <p style="background: grey; color: white ; text-align: center; padding: 5px; border-radius: 35px; width: 135px"> 
                                                </c:if>

                                                ${p.status.postStatusValue}
                                            </p>
                                            <c:if test="${p.status.postStatusId == 3}">
                                                <p style="color: red">
                                                    Lý do : ${p.reason}
                                                </p>
                                            </c:if>
                                            <c:if test="${p.status.postStatusId == 4}">
                                                <p style="color: grey">
                                                    Báo cáo : ${p.reason}
                                                </p>
                                            </c:if>

                                        </td>
                                        <td>
                                            <div class="d-flex">
                                                <form action="UpdatePostPublicStatus" method="get">
                                                    <input type="hidden" value="${p.postId}" name="postId">
                                                    <c:if test="${p.isPublic==true}">
                                                        <input type="hidden" value="false" name="PublicStatus">
                                                        <button type="submit"
                                                                class="btn btn-outline-success me-2">
                                                            <i class="fa-solid fa-eye-slash"></i>
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${p.isPublic==false}">
                                                        <input type="hidden" value="true" name="PublicStatus">
                                                        <button type="submit"
                                                                class="btn btn-outline-danger me-2">
                                                            <i class="fa-regular fa-eye-slash"></i>
                                                        </button>
                                                    </c:if>
                                                </form>
                                                <form action="viewPostDetails" method="get">
                                                    <input type="hidden" value="${p.postId}" name="postId">
                                                    <button type="submit"
                                                            class="btn btn-outline-success me-2">
                                                        <i class="fa-solid fa-eye"></i>
                                                    </button>
                                                </form>
                                                <c:if test="${p.status.postStatusId !=4}">
                                                    <form action="editPost" method="post">
                                                        <input type="hidden" value="${p.postId}" name="postId">
                                                        <input type="hidden" value="${p.postType.postTypeId}" name="postType">
                                                        <button type="submit"
                                                                class="btn btn-outline-success me-2">
                                                            <i class="fa-solid fa-pen"></i>
                                                        </button>
                                                    </form>
                                                </c:if>
                                                <form action="deletePost" method="post">
                                                    <input type="hidden" value="${p.postId}" name="postId">
                                                    <button type="submit"
                                                            class="btn btn-outline-danger me-2">
                                                        <i class="fa-solid fa-trash"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-center">
                <nav aria-label="Page navigation example col-12">
                    <ul class="pagination">
                        <%--For displaying Previous link except for the 1st page --%>
                        <c:if test="${currentPage != 1}">
                            <li class="page-item">
                                <a class="page-link" href="listPost?page=${currentPage - 1}" aria-label="Previous">
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
                                    <li class="page-item"><a class="page-link" href="listPost?page=${i}">${i}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                        <%--For displaying Next link --%>
                        <c:if test="${currentPage lt noOfPages}">
                            <li class="page-item">
                                <a class="page-link" href="listPost?page=${currentPage + 1}" aria-label="Next">
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
