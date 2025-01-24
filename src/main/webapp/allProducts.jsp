<%--
  Created by IntelliJ IDEA.
  User: nipun
  Date: 1/24/25
  Time: 1:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Catalog</title>
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
    </style>
</head>
<body>

<!-- Navigation Bar -->
<%@include file="dasboardNavBar.jsp"%>

<div class="container my-5">
    <!-- Add New Product Button -->
    <div class="text-end mb-4">
        <a href="addProductPage.jsp" class="btn btn-primary">Add New Product</a>
    </div>

    <!-- Products Table -->
    <h2 class="text-white">Product Catalog</h2>
    <table class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>#</th>
            <th>Product Name</th>
            <th>Description</th>
            <th>Category</th>
            <th>Price</th>
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
            <td>
                <a href="editProduct.jsp?id=1" class="btn btn-warning btn-sm">Edit</a>
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
            <td>
                <a href="editProduct.jsp?id=2" class="btn btn-warning btn-sm">Edit</a>
                <a href="deleteProduct.jsp?id=2" class="btn btn-danger btn-sm">Delete</a>
            </td>
        </tr>
        <!-- Add more products dynamically here -->
        </tbody>
    </table>

    <!-- Add New Product Button (again at the bottom) -->
    <div class="text-end mt-4">
        <a href="addProductPage.jsp" class="btn btn-primary">Add New Product</a>
    </div>
</div>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

