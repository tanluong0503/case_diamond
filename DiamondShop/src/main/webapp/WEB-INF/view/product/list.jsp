<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>PRODUCT</title>
    <jsp:include page="/WEB-INF/view/layout/css.jsp"></jsp:include>
    <style>
        html,
        .content-page {
            background: white;
        }

    </style>

</head>

<body>
<jsp:include page="/WEB-INF/view/layout/header.jsp"></jsp:include>
<!-- Begin page -->
<div id="wrapper">

    <!-- Topbar Start -->

    <!-- end Topbar -->

    <!-- ============================================================== -->
    <!-- Start Page Content here -->
    <!-- ============================================================== -->

    <div class="content-page">
        <div class="content">

            <!-- Start Content-->
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Upvex</a></li>
                                    <li class="breadcrumb-item"><a href="/products?action=create">Create Product</a></li>
                                </ol>
                            </div>
                            <h4 class="page-title">List Product</h4>
                            <table class="table m-0">

                                <thead class="thead-light">
                                <tr>
                                    <th>Name product</th>
                                    <th>Price</th>
                                    <th>Describe</th>
                                    <th>Image</th>
                                    <th style="text-align: center">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${requestScope.listProduct}" var="item">
                                    <tr>
                                        <td>${item.getProductName()}</td>
<%--                                        <td style="text-align: right">${item.getPrice()}</td>--%>
                                        <td style="text-align: right">
                                            <fmt:formatNumber type="number" pattern="###,###,###,### $" value="${item.getPrice()}" />
                                        </td>
                                        <td>${item.getProductDescribe()}</td>
                                        <td>
                                            <img src="${item.getImage()}" width="100" height="100" alt="image product">
                                        </td>
                                        <td style="display: flex; justify-content: space-evenly;">
                                            <a href="/products?action=update&id=${item.getId()}"><i class="ion ion-md-create"></i></a>
                                            <a href="/products?action=info&id=${item.getId()}"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

            </div> <!-- container -->

        </div> <!-- content -->

        <!-- Footer Start -->

        <!-- end Footer -->

    </div>

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->


</div>

<!-- /Right-bar -->
<jsp:include page="/WEB-INF/view/layout/nav-bar.jsp"></jsp:include>


<!-- Vendor js -->

<jsp:include page="/WEB-INF/view/layout/script.jsp"></jsp:include>

</body>

</html>