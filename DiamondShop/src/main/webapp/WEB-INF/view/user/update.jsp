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
                                    <li class="breadcrumb-item"><a href="/products">User</a></li>
                                    <li class="breadcrumb-item active">Update User</li>
                                </ol>
                            </div>
                            <h4 class="page-title">Update User</h4>
                            <div class="col-lg-12">

                                <div class="card-box">
                                    <form action="/users?action=edit" class="parsley-examples" method="post" novalidate="">
                                        <c:if test="${user != null}">
                                            <input type="hidden" name="id" value="<c:out value='${user.id}' />"/>
                                        </c:if>
                                        <div class="form-group">
                                            <label for="fullname">Full Name</label>
                                            <input value="<c:out value='${user.fullName}' />" type="text" name="fullname" parsley-trigger="change" required="" placeholder="Enter Full Name" class="form-control parsley-error" id="fullname"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="phone">Phone</label>
                                            <input value="<c:out value='${user.phone}' />" type="number" name="phone" parsley-trigger="change" required="" placeholder="Enter your phone" class="form-control parsley-error" id="phone">
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Product Describe</label>
                                            <input value="<c:out value='${user.email}' />" type="email" name="email" parsley-trigger="change" required="" placeholder="Enter your email" class="form-control parsley-error" id="email">
                                        </div>
                                        <div class="form-group">
                                            <label for="address">Address</label>
                                            <input value="<c:out value='${user.address}' />" type="text" name="address" parsley-trigger="change" required="" placeholder="Enter your address" class="form-control parsley-error" id="address">
                                        </div>
                                        <div class="form-group text-right mb-0">
                                            <button class="btn btn-primary waves-effect waves-light mr-1" type="submit">
                                                Update
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