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
    <!-- Include SweetAlert CSS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
        #thumbnailPreview {
            width: 100%;
            height: auto;
            border-radius: 10px;
            border: 1px solid #ddd;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<%@include file="dasboardNavBar.jsp"%>

<div class="container my-5">
    <h2 class="text-white">Add New Product</h2>
    <p class="text-white">You can see all sales analysis results more clearly and completely.</p>
    <form action="addProduct-servlet" method="post" enctype="multipart/form-data">
        <div class="row">
            <!-- Thumbnail Section -->
            <div class="col-md-4">
                <div class="card p-4">
                    <h5>Thumbnail</h5>
                    <img id="thumbnailPreview" src="https://via.placeholder.com/150" class="img-fluid rounded" alt="Thumbnail Preview">
                    <p class="text-muted mt-2">Set the product thumbnail image. Only .png, .jpg, and .jpeg files are accepted.</p>
                    <input type="file" class="form-control" name="thumbnail" id="thumbnail" required />
                </div>
            </div>

            <!-- General and Pricing Section -->
            <div class="col-md-8">
                <div class="card p-4">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="general-tab" data-bs-toggle="tab" data-bs-target="#general" type="button" role="tab">General</button>
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

                            <!-- Description Field -->
                            <div class="mb-3">
                                <label for="description" class="form-label">Description</label>
                                <textarea class="form-control" id="description" name="description" rows="4" placeholder="Enter product description"></textarea>
                            </div>

                            <!-- Stock Field -->
                            <div class="mb-3">
                                <label for="stock" class="form-label">Stock</label>
                                <input type="number" class="form-control" id="stock" name="stock" placeholder="Enter stock quantity" required>
                            </div>

                            <!-- Pricing Section -->
                            <div class="mb-3">
                                <label for="basePrice" class="form-label">Base Price</label>
                                <input type="text" class="form-control" id="basePrice" name="basePrice" placeholder="Set product price" required>
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

<!-- JavaScript to preview image -->
<script>
    document.getElementById("thumbnail").addEventListener("change", function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById("thumbnailPreview").src = e.target.result;
            }
            reader.readAsDataURL(file);
        }
    });

    // SweetAlert for displaying messages
    <%
        String message = (String) request.getAttribute("message");
        String alertType = (String) request.getAttribute("alertType"); // "success" or "error"
        if (message != null && alertType != null) {
    %>
    Swal.fire({
        icon: '<%= alertType %>',
        title: '<%= alertType.equals("success") ? "Success" : "Error" %>',
        text: '<%= message %>',
        confirmButtonColor: '#635bff'
    });
    <% } %>
</script>

</body>
</html>
