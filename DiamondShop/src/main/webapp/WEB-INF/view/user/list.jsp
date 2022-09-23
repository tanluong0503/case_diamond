<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        .fa-trash:hover {
            color: red;
            transition: 0.3s;
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
                                    <li class="breadcrumb-item"><a href="/users?action=create">Create User</a></li>
                                </ol>
                            </div>
                            <h4 class="page-title">List Users</h4>
                            <table class="table m-0">

                                <thead class="thead-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Full Name</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Adress</th>
                                    <th style="text-align: center">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listUser}" var="item">
                                    <tr>
                                        <td>${item.getId()}</td>
                                        <td>${item.getFullName()}</td>
                                        <td>${item.getPhone()}</td>
                                        <td>${item.getEmail()}</td>
                                        <td>${item.getAddress()} </td>
                                        <td style="display: flex; justify-content: space-evenly;">
                                            <a href="/users?action=edit&id=${item.getId()}"><i class="ion ion-md-create"></i></a>
                                            <a href="/users?action=info&id=${item.getId()}"><i class="fa fa-trash" aria-hidden="true"></i></a>
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