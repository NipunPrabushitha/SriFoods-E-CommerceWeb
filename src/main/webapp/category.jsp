<%@ page import="lk.ijse.model.CategoryDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Management</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.15/dist/sweetalert2.min.css" rel="stylesheet">
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
    <!-- Add Category Form -->
    <h2 class="text-white text-center mb-4">Category Management</h2>
    <div class="card p-4 mb-5">
        <form action="saveCategory-servlet" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="category_name" class="form-label">Category Name</label>
                <input type="text" class="form-control" id="category_name" name="category_name" required>
            </div>
            <div class="mb-3">
                <label for="category_description" class="form-label">Description</label>
                <textarea class="form-control" id="category_description" name="category_description" rows="3" required></textarea>
            </div>
            <div class="mb-3">
                <label for="category_image" class="form-label">Upload Image</label>
                <input type="file" class="form-control" id="category_image" name="category_image" accept="image/*" required onchange="previewImage(event)">
            </div>
            <!-- Preview Section -->
            <div class="mb-3">
                <label class="form-label">Image Preview</label>
                <div>
                    <img id="image_preview" src="#" alt="Selected Image" style="max-width: 100%; max-height: 200px; display: none; border: 1px solid #ccc; padding: 5px; border-radius: 8px;">
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Add Category</button>
        </form>
    </div>
</div>

    <!-- Categories Table -->
    <div class="card p-4">
        <h4 class="mb-4">Category List</h4>
        <%
            List<CategoryDTO> dataList = (List<CategoryDTO>) request.getAttribute("categories");
            if(dataList != null && !dataList.isEmpty()){
        %>

        <table class="table table-bordered table-striped table-hover">
            <thead>
            <tr>
                <th>#</th>
                <th>Category Name</th>
                <th>Description</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                int index = 1; // To display serial numbers
                for(CategoryDTO categoryDTO : dataList){
            %>
            <tr>
                <td><%= categoryDTO.getId() %></td>
                <td><%= categoryDTO.getCategoryName() %></td>
                <td><%= categoryDTO.getDescription() %></td>
                <td>
                    <img src="<%= categoryDTO.getFilepath() %>" alt="<%= categoryDTO.getFilepath() %>" style="width: 100px; height: auto;">
                </td>
                <td>
                    <button class="btn btn-warning btn-sm">Edit</button>
                    <a href="#" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>

        <%
            }
        %>

    </div>
</div>

<!-- Update Category Modal -->
<div class="modal fade" id="updateCategoryModal" tabindex="-1" aria-labelledby="updateCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="container m-2">
                <form>
                    <div class="mb-3">
                        <label for="updated_category_id" class="form-label">Category ID</label>
                        <input type="text" class="form-control" id="updated_category_id" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="updated_category_name" class="form-label">Category Name</label>
                        <input type="text" class="form-control" id="updated_category_name">
                    </div>
                    <div class="mb-3">
                        <label for="updated_category_description" class="form-label">Description</label>
                        <textarea class="form-control" id="updated_category_description" rows="3"></textarea>
                    </div>
                    <button id="btn_update_category" type="submit" class="btn btn-primary">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Include Bootstrap JS, jQuery, and SweetAlert -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.15/dist/sweetalert2.min.js"></script>

<script>
    // Function to preview the selected image
    const previewImage = (event) => {
        const file = event.target.files[0];
        const preview = document.getElementById('image_preview');

        if (file) {
            const reader = new FileReader();
            reader.onload = () => {
                preview.src = reader.result;
                preview.style.display = 'block';
            };
            reader.readAsDataURL(file);
        } else {
            preview.src = '#';
            preview.style.display = 'none';
        }
    };
    // Function to show SweetAlert based on URL parameters
    $(document).ready(function () {
        // Check if there is a success or error message in the URL
        const urlParams = new URLSearchParams(window.location.search);
        const successMessage = urlParams.get('success');
        const errorMessage = urlParams.get('error');

        if (successMessage) {
            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: successMessage
            });
        } else if (errorMessage) {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: errorMessage
            });
        }
    });

    // Function to populate modal with category data and show modal
    const editCategory = (id, name, description) => {
        // Setting the modal input values dynamically
        $('#updated_category_id').val(id);
        $('#updated_category_name').val(name);
        $('#updated_category_description').val(description);

        // Showing the modal
        $('#updateCategoryModal').modal('show');
    }
</script>

</body>
</html>
