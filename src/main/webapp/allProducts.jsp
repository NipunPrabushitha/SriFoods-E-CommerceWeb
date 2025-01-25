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
    <div class="card p-4">
        <table class="table table-bordered table-striped table-hover">
            <thead>
            <tr>
                <th>#</th>
                <th>Product Name</th>
                <th>Description</th>
                <th>Category</th>
                <th>Price</th>
                <th>Image Link</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <!-- Example Product 1 -->
            <tr>
                <td>1</td>
                <td>Smartphone</td>
                <td>Latest model with 5G support</td>
                <td>Electronics</td>
                <td>$999</td>
                <td><a href="https://example.com/smartphone-image.jpg" target="_blank">View Image</a></td>
                <td>
                    <!-- Edit Button - Trigger Modal -->
                    <button class="btn btn-warning btn-sm"
                            onclick="editProduct(1, 'Smartphone', 'Latest model with 5G support', 'Electronics', '$999', 'https://example.com/smartphone-image.jpg')">Edit</button>
                    <a href="deleteProduct.jsp?id=1" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
            <!-- Example Product 2 -->
            <tr>
                <td>2</td>
                <td>Leather Jacket</td>
                <td>Premium quality leather jacket</td>
                <td>Clothing</td>
                <td>$199</td>
                <td><a href="https://example.com/jacket-image.jpg" target="_blank">View Image</a></td>
                <td>
                    <!-- Edit Button - Trigger Modal -->
                    <button class="btn btn-warning btn-sm"
                            onclick="editProduct(2, 'Leather Jacket', 'Premium quality leather jacket', 'Clothing', '$199', 'https://example.com/jacket-image.jpg')">Edit</button>
                    <a href="deleteProduct.jsp?id=2" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
            </tbody>
        </table>
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
                <form>
                    <div class="mb-3">
                        <label for="updated_product_id" class="form-label">Product ID</label>
                        <input type="text" class="form-control" id="updated_product_id" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="updated_name" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="updated_name">
                    </div>
                    <div class="mb-3">
                        <label for="updated_description" class="form-label">Description</label>
                        <input type="text" class="form-control" id="updated_description">
                    </div>
                    <div class="mb-3">
                        <label for="updated_category" class="form-label">Category</label>
                        <input type="text" class="form-control" id="updated_category">
                    </div>
                    <div class="mb-3">
                        <label for="updated_price" class="form-label">Price</label>
                        <input type="text" class="form-control" id="updated_price">
                    </div>
                    <div class="mb-3">
                        <label for="updated_image_link" class="form-label">Image Link</label>
                        <input type="text" class="form-control" id="updated_image_link">
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
    // Function to populate modal with product data and show modal
    const editProduct = (id, name, description, category, price, imageLink) => {
        // Setting the modal input values dynamically
        $('#updated_product_id').val(id);
        $('#updated_name').val(name);
        $('#updated_description').val(description);
        $('#updated_category').val(category);
        $('#updated_price').val(price);
        $('#updated_image_link').val(imageLink);

        // Showing the modal
        $('#updateProductModal').modal('show');
    }
</script>

</body>
</html>
