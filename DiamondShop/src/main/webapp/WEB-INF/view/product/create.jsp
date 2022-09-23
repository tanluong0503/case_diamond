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
                  <li class="breadcrumb-item"><a href="/products">List Product</a></li>
                </ol>
              </div>
              <h4 class="page-title">Create Product</h4>
              <div class="col-lg-12">
                <div class="card-box">
                  <div>
                    <c:forEach items="${requestScope.errors}" var="item">
                      <li class="alert alert-danger ">${item}</li>
                    </c:forEach>
                  </div>
                  <div>
                    <c:if test="${requestScope.message != null}">
                      <h1 class="alert alert-success" >${message}</h1>
                    </c:if>
                  </div>

                  <form action="/products?action=create" class="parsley-examples" method="post" novalidate="">
                    <div class="form-group">
                      <label for="productName">Product name</label>
                      <input type="text" name="productName" parsley-trigger="change" required="" placeholder="Enter Product Name" class="form-control parsley-error" id="productName"/>
                    </div>
                    <div class="form-group">
                      <label for="productPrice">Price</label>
                      <input type="number" name="productPrice" parsley-trigger="change" required="" placeholder="Enter Product Price" class="form-control parsley-error" id="productPrice">
                    </div>
                    <div class="form-group">
                      <label for="productDescribe">Product Describe</label>
                      <input type="text" name="productDescribe" parsley-trigger="change" required="" placeholder="Enter Product Describe" class="form-control parsley-error" id="productDescribe">
                    </div>
                    <div class="form-group">
                      <label for="productImage">Image</label>
                      <input type="text" name="productImage" parsley-trigger="change" required="" placeholder="Enter URL Product Image" class="form-control parsley-error" id="productImage">
                    </div>
                    <div class="form-group text-right mb-0">
                      <button class="btn btn-primary waves-effect waves-light mr-1" type="submit">
                        Create
                      </button>
                      <a href="/products"><i class="btn btn-secondary">Cancel</i></a>
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