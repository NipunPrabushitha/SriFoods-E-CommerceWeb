<%@ page import="lk.ijse.model.ProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Catalog</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f9fc;
        }
        .navbar {
            background-color: #2c3e50;
        }
        .navbar-brand {
            color: #fff;
        }
        .navbar a {
            color: #fff;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            margin-bottom: 1.5rem;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: bold;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }
        .table thead {
            background-color: #007bff;
            color: white;
        }
        .table-striped tbody tr:nth-child(odd) {
            background-color: #f1f1f1;
        }
        .table-hover tbody tr:hover {
            background-color: #eef2f7;
        }
        .text-end a {
            text-decoration: none;
        }
        h2 {
            font-size: 2rem;
            color: #333;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<%@include file="dasboardNavBar.jsp"%>

<div class="container my-5">
    <!-- Add New Product Button -->
    <div class="text-end mb-4">
        <a href="addProduct.jsp" class="btn btn-primary">Add New Product</a>
    </div>

    <!-- Products Table -->
    <h2 class="text-white text-center mb-4">Product Catalog</h2>
    <%
        List<ProductDTO> dataList = (List<ProductDTO>) request.getAttribute("products");
        if(dataList != null && !dataList.isEmpty()){
    %>
    <div class="card p-4">
        <table class="table table-bordered table-striped table-hover">
            <thead>
            <tr>
                <th>#</th>
                <th>Product Name</th>
                <th>Description</th>
                <th>Category</th>
                <th>Stock</th>
                <th>Price</th>
                <th>Image Link</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
                <%
                int index = 1; // To display serial numbers
                for(ProductDTO productDTO : dataList){
            %>
            <tr>
                <td><%= productDTO.getId() %></td>
                <td><%= productDTO.getName() %></td>
                <td><%= productDTO.getDescription() %></td>
                <td><%= productDTO.getCategory().getCategoryName() %></td>
                <td><%= productDTO.getStock() %></td>
                <td><%= productDTO.getPrice() %></td>
                <td>
                    <img src="<%= productDTO.getImagePath() %>" alt="<%= productDTO.getImagePath() %>" style="width: 100px; height: auto;">
                </td>
                <td>
                    <button class="btn btn-warning btn-sm" onclick="editProduct('<%= productDTO.getId() %>', '<%= productDTO.getName() %>', '<%= productDTO.getDescription() %>', '<%= productDTO.getCategory().getCategoryName() %>', '<%= productDTO.getPrice() %>', '<%= productDTO.getStock() %>', '<%= productDTO.getImagePath() %>')">Edit</button>
                    <a href="deleteProductServlet?id=<%= productDTO.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this category?')">Delete</a>
                </td>

                <!-- Update Product Button -->
            </tr>
                <%
                }
            %>

        </table>
        <%
            }
        %>

    </div>

    <!-- Add New Product Button (again at the bottom) -->
    <div class="text-end mt-4">
        <a href="category-names" class="btn btn-primary">Add New Product</a>
    </div>
</div>

<!-- Update Product Modal -->
<div class="modal fade" id="updateProductModal" tabindex="-1" aria-labelledby="updateProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="container m-2">
                <form action="updateProduct-servlet" method="post">
                    <div class="mb-3">
                        <label for="updated_product_id" class="form-label">Product ID</label>
                        <input type="text" class="form-control" name="product_id" id="updated_product_id" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="updated_name" class="form-label">Product Name</label>
                        <input type="text" class="form-control" name="product_name" id="updated_name">
                    </div>
                    <div class="mb-3">
                        <label for="updated_description" class="form-label">Description</label>
                        <input type="text" class="form-control" name="product_description" id="updated_description">
                    </div>
                    <div class="mb-3">
                        <label for="updated_category" class="form-label">Category</label>
                        <input type="text" class="form-control" name="product_category" id="updated_category">
                    </div>
                    <div class="mb-3">
                        <label for="updated_price" class="form-label">Price</label>
                        <input type="text" class="form-control" name="product_price" id="updated_price">
                    </div>
                    <div class="mb-3">
                        <label for="updated_stock" class="form-label">Stock</label>
                        <input type="text" class="form-control" name="product_stock" id="updated_stock">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Image Preview</label>
                        <div>
                            <img id="updated_image_preview" src="#" alt="Selected Image"
                                 style="max-width: 100%; max-height: 200px; display: none; border: 1px solid #ccc; padding: 5px; border-radius: 8px;">
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="updated_image_link" class="form-label">Image Link</label>
                        <input type="text" class="form-control" name="image_link" id="updated_image_link">
                    </div>
                    <button id="btn_update_product" type="submit" class="btn btn-primary">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Include Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    const editProduct = (id, name, description, category, price, stock, imageLink) => {
        // Set values in the modal fields
        $('#updated_product_id').val(id);
        $('#updated_name').val(name);
        $('#updated_description').val(description);
        $('#updated_category').val(category);
        $('#updated_price').val(price);
        $('#updated_stock').val(stock);
        $('#updated_image_link').val(imageLink);

        // Update the image preview
        const preview = document.getElementById('updated_image_preview');
        if (imageLink) {
            preview.src = imageLink;
            preview.style.display = 'block'; // Ensure the image is displayed
        } else {
            preview.src = '#';
            preview.style.display = 'none'; // Hide if no image link is provided
        }

        // Show the modal
        $('#updateProductModal').modal('show');
    };

    // Function to display alert messages
    const showAlert = () => {
        const urlParams = new URLSearchParams(window.location.search);
        const successMessage = urlParams.get('success');
        const errorMessage = urlParams.get('error');

        if (successMessage) {
            alert(successMessage); // Show success message
        } else if (errorMessage) {
            alert(errorMessage); // Show error message
        }
    };

    // Call the function on page load
    document.addEventListener("DOMContentLoaded", showAlert);

</script>

</body>
</html>
