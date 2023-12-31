<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <h1 class="h3 mb-0 text-gray-800">Chỉnh sửa bài viết trao đổi</h1>
                </div>
                <hr>
                <!-- Content Row -->
                <form action="saveEditExchange" method="post" enctype="multipart/form-data">
                    <div class="row m-5 rounded-3" style="background-color: papayawhip">
                        <!-- Category Post -->
                        <div class="form-floating mt-5">
                            <select class="form-select" id="floatingSelect" aria-label="Floating label select example"
                                    name="category" required>
                                <option selected disabled value="">Danh mục trao đổi</option>
                                <c:forEach items="${categories}" var="c">
                                    <option value="${c.categoryId}"
                                            <c:if test="${post.category.categoryId == c.categoryId}">selected</c:if>
                                            >${c.categoryName}</option>
                                </c:forEach>
                            </select>
                            <label for="floatingSelect">Danh mục bài viết</label>
                        </div>

                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Tiêu đề bài trao đổi <span style="color: red">*</span></label>
                            <input type="text" class="form-control" id="exampleFormControlInput1" 
                                   placeholder="Tiêu đề bài viết" name="title" value="${post.title}" required minlength="15" maxlength="50">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlTextarea1" class="form-label">Nội dung bài trao đổi <span style="color: red">*</span></label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"
                                      name="content" required minlength="250">${post.content}</textarea>
                        </div>
                        <div class="mb-3">
                            <label for="formFile" class="form-label">Ảnh bài trao đổi <span style="color: red">*</span></label>
                            <input class="form-control" type="file" name="file" id="file" accept="image/*">
                            <img src="${post.img}" alt="alt" width="160px" height="160px" style="background-size: cover"/>
                            <input type="hidden" name="existImg" value="${post.img}">
                            <input type="hidden" name="postId" value="${post.postId}">
                            <input type="hidden" name="exchangeId" value="${post.exchange.exchangeId}">
                        </div>
                        <div class="mb-3">
                            <input type="checkbox" id="freeGiftCheckbox" onchange="updateInputRequired()"
                                   <c:if test="${post.exchange.isFree == true}">
                                       checked
                                   </c:if>
                                   > Trao tặng miễn phí
                        </div>
                        <div class="mb-3" id="priceInput"
                             <c:if test="${post.exchange.isFree == true}">
                                 style="display: none"
                             </c:if>
                             >
                            <label for="exampleFormControlInput1" class="form-label">Giá<span style="color: red">*</span></label>
                            <div class="input-group mb-3">
                                <span class="input-group-text">VNĐ</span>
                                <fmt:formatNumber value="${post.exchange.price}" pattern="#.0" var="formattedPrice" />
                                <input id="exchangePrice" type="number" step="any" min="0" name="price" class="form-control" aria-label="Amount (to the nearest dollar)" value="${formattedPrice}" required>                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Địa chỉ trao đổi thú cưng <span style="color: red">*</span></label>
                            <input type="text" class="form-control" id="exampleFormControlInput1" 
                                   placeholder="Địa chỉ trao đổi thú cưng" name="address" value="${post.exchange.address}" required>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center">
                        <button type="submit" class="btn btn-outline-info">Lưu</button>
                    </div>
                </form>
            </div>
        </section>

        <%@ include file="../../asset/includes/User/FooterUser.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
        <script>
                                function chooseTypePost(select) {
                                    const selectedValue = select.value;
                                    if (selectedValue === '1') {
                                        document.getElementById("address").style.display = "block";
                                    } else {
                                        document.getElementById("address").style.display = "none";
                                    }
                                }
                                function updateInputRequired() {
                                    // Get the checkbox and input elements
                                    var checkbox = document.getElementById('freeGiftCheckbox');
                                    var exchangePriceInput = document.getElementById('exchangePrice');
                                    var priceInput = document.getElementById('priceInput');

                                    // Check if the checkbox is checked
                                    if (checkbox.checked) {
                                        // If checked, set the input value to 0 and make it not required
                                        exchangePriceInput.value = 0;
                                        exchangePriceInput.removeAttribute('required');
                                        exchangePriceInput.style.display = 'none';
                                        priceInput.style.display = 'none';
                                    } else {
                                        // If not checked, set the input as required
                                        exchangePriceInput.setAttribute('required', 'required');
                                        exchangePriceInput.style.display = 'block';
                                        priceInput.style.display = 'block';
                                        exchangePriceInput.value = '';
                                    }
                                }
        </script>
    </body>

</html>
