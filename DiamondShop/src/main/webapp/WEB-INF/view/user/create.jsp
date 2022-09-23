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

        .card-box > div > li {
            color: red;
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
                                    <li class="breadcrumb-item"><a href="/users">List User</a></li>
                                </ol>
                            </div>
                            <h4 class="page-title">Create User</h4>
                            <div class="col-lg-12">

                                <div class="card-box">
                                    <div>
                                        <c:forEach items="${requestScope.errors}" var="item">
                                            <li>${item}</li>
                                        </c:forEach>
                                    </div>
                                    <div>
                                        <c:if test="${requestScope.message != null}">
                                            <h1 class="alert alert-success" >${message}</h1>
                                        </c:if>
                                    </div>
                                    <form action="/users?action=create" class="parsley-examples" method="post"
                                          novalidate="">
                                        <div class="form-group">
                                            <label for="username">Username</label>
                                            <input type="text" name="username"
                                                   placeholder="Enter username" class="form-control parsley-error"
                                                   id="username"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="password">Password</label>
                                            <input type="password" name="password"
                                                   placeholder="Enter password" class="form-control parsley-error"
                                                   id="password">
                                        </div>
                                        <div class="form-group">
                                            <label for="fullname">Full name</label>
                                            <input type="text" name="fullname"
                                                   placeholder="Enter full name" class="form-control parsley-error"
                                                   id="fullname">
                                        </div>
                                        <div class="form-group">
                                            <label for="phone">Phone</label>
                                            <input type="number" name="phone"
                                                   placeholder="Enter your phone" class="form-control parsley-error"
                                                   id="phone">
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input type="email" name="email"
                                                   placeholder="Enter your email" class="form-control parsley-error"
                                                   id="email">
                                        </div>
                                        <div class="form-group">
                                            <label for="address">Address</label>
                                            <input type="text" name="address"
                                                   placeholder="Enter your address" class="form-control parsley-error"
                                                   id="address">
                                        </div>
                                        <div class="form-group text-right mb-0">
                                            <button class="btn btn-primary waves-effect waves-light mr-1" type="submit">
                                                Create
                                            </button>
                                            <a href="/users"><i class="btn btn-secondary">Cancel</i></a>
                                        </div>

                                    </form>
                                </div> <!-- end card-box -->
                            </div>
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