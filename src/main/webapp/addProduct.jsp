<%@ page import="lk.ijse.entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.model.CategoryDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Product</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #222;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            background-color: #635bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #524ae1;
        }
        .form-control, .form-select {
            border-radius: 8px;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<%@include file="dasboardNavBar.jsp"%>

<div class="container my-5">
    <h2 class="text-white">Add New Product</h2>
    <p class="text-white">You can see all sales analysis results more clearly and completely.</p>
    <form action="/addProductServlet" method="POST" enctype="multipart/form-data">
        <div class="row">
            <!-- Thumbnail Section -->
            <div class="col-md-4">
                <div class="card p-4">
                    <h5>Thumbnail</h5>
                    <img src="https://via.placeholder.com/150" class="img-fluid rounded" alt="Thumbnail">
                    <p class="text-muted mt-2">Set the product thumbnail image. Only .png, .jpg, and .jpeg files are accepted.</p>
                    <input type="file" class="form-control" name="thumbnail" required />
                </div>
            </div>

            <!-- General and Pricing Section -->
            <div class="col-md-8">
                <div class="card p-4">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="general-tab" data-bs-toggle="tab" data-bs-target="#general" type="button" role="tab">General</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="advance-tab" data-bs-toggle="tab" data-bs-target="#advance" type="button" role="tab">Advance</button>
                        </li>
                    </ul>
                    <div class="tab-content mt-3">
                        <!-- General Tab -->
                        <div class="tab-pane fade show active" id="general" role="tabpanel">
                            <div class="mb-3">
                                <label for="productName" class="form-label">Product Name</label>
                                <input type="text" class="form-control" id="productName" name="productName" placeholder="Enter product name" required>
                            </div>
                            <div class="mb-3">
                                <label for="category" class="form-label">Category</label>
                                <select class="form-select" id="category" name="category" required>
                                    <option selected disabled>Select category</option>
                                    <%
                                        List<CategoryDTO> categories = (List<CategoryDTO>) request.getAttribute("categoryNames");
                                        if (categories != null) {
                                            for (CategoryDTO category : categories) {
                                    %>
                                    <option value="<%= category.getId() %>"><%= category.getCategoryName() %></option>
                                    <%
                                        }
                                    } else {
                                    %>
                                    <option disabled>No categories available</option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <!-- Pricing Section -->
                            <div class="mb-3">
                                <label for="basePrice" class="form-label">Base Price</label>
                                <input type="text" class="form-control" id="basePrice" name="basePrice" placeholder="Set product price" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Discount Type</label>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="discountType" value="noDiscount" checked>
                                    <label class="form-check-label">No Discount</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="discountType" value="percentage">
                                    <label class="form-check-label">Percentage</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="discountType" value="fixedPrice">
                                    <label class="form-check-label">Fixed Price</label>
                                </div>
                            </div>
                        </div>
                        <!-- Save Button -->
                        <div class="text-end mt-4">
                            <button type="submit" class="btn btn-primary">Save Product</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
