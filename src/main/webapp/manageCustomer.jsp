<%--
  Created by IntelliJ IDEA.
  User: nipun
  Date: 1/26/25
  Time: 9:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.model.UserDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
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
        .navbar-brand, .navbar a {
            color: #fff;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            margin-bottom: 1.5rem;
        }
        .btn {
            border-radius: 25px;
            font-weight: bold;
        }
        .btn-success {
            background-color: #28a745;
            border: none;
        }
        .btn-danger {
            background-color: #dc3545;
            border: none;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }
        .table thead {
            background-color: #007bff;
            color: white;
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
    <!-- Page Heading -->
    <h2 class="text-center mb-4 text-white">Customer Management</h2>

    <%
        List<UserDTO> userList = (List<UserDTO>) request.getAttribute("users");
        if (userList != null && !userList.isEmpty()) {
    %>
    <div class="card p-4">
        <table class="table table-bordered table-striped table-hover">
            <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (UserDTO user : userList) {
                    /*if ("customer".equalsIgnoreCase(user.getRole())) { // Show only customers*/
            %>
            <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getName() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getRole() %></td>
                <td>
                    <% if (user.isStatus()) { %>
                    <span class="badge bg-success">Active</span>
                    <% } else { %>
                    <span class="badge bg-danger">Inactive</span>
                    <% } %>
                </td>
                <td>
                    <% if (user.isStatus()) { %>
                    <a href="updateUserStatusServlet?id=<%= user.getId() %>&status=false"
                       class="btn btn-danger btn-sm" onclick="return confirm('Deactivate this user?')">Deactivate</a>
                    <% } else { %>
                    <a href="updateUserStatusServlet?id=<%= user.getId() %>&status=true"
                       class="btn btn-success btn-sm" onclick="return confirm('Activate this user?')">Activate</a>
                    <% } %>
                </td>
            </tr>
            <%

                }
            %>
            </tbody>
        </table>
    </div>
    <%
    } else {
    %>
    <p class="text-center">No customers found.</p>
    <%
        }
    %>
</div>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

