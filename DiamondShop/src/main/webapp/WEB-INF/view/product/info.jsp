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

    .form-control {
      border: none;
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
                  <li class="breadcrumb-item"><a href="/products">Product</a></li>
                  <li class="breadcrumb-item active">Info Product</li>
                </ol>
              </div>
              <h4 class="page-title">Info Product</h4>
              <div class="col-lg-12">

                <div class="card-box">
                  <form action="/products?action=delete" class="parsley-examples" method="post" novalidate="">
                    <c:if test="${product != null}">
                      <input type="hidden" name="id" value="<c:out value='${product.id}' />" readonly/>
                    </c:if>
                    <div class="form-group">
                      <label for="productNameUpdate">Product name</label>
                      <input readonly value="<c:out value='${product.productName}' />" type="text" name="productNameUpdate" parsley-trigger="change" required="" placeholder="Enter Product Name" class="form-control parsley-error" id="productNameUpdate"/>
                    </div>
                    <div class="form-group">
                      <label for="productPriceUpdate">Price</label>
                      <input readonly value="<c:out value='${product.price}' />" type="text" name="productPriceUpdate" parsley-trigger="change" required="" placeholder="Enter Product Price" class="form-control parsley-error" id="productPriceUpdate">
                    </div>
                    <div class="form-group">
                      <label for="productDescribeUpdate">Product Describe</label>
                      <input readonly value="<c:out value='${product.productDescribe}' />" type="text" name="productDescribeUpdate" parsley-trigger="change" required="" placeholder="Enter Product Describe" class="form-control parsley-error" id="productDescribeUpdate">
                    </div>
                    <div class="form-group">
                      <span>Image</span>
                      <img style="margin-left: 20px" width="200" height="200" src="${product.image}" alt="image-${product.productName}">
                    </div>
                    <div class="form-group text-right mb-0">
                      <button class="btn btn-danger waves-effect waves-light mr-1" type="submit">
                        Delete
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