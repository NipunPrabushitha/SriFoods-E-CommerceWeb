<%--
  Created by IntelliJ IDEA.
  User: nipun
  Date: 1/24/25
  Time: 1:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Navigation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-pzjw8f+ua7Kw1TIq0nM6fwxZ9W+EX2AhB1dp9tO/nY1hOUiRx6+40btGvH9gC1B8" crossorigin="anonymous">
    <style>
        body {
            background: linear-gradient(135deg, #2b5876, #4e4376);
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        nav.navbar {
            background: linear-gradient(135deg, #003135, #024950);
        }
        nav.navbar {
            margin-bottom: 0; /* Removes bottom margin */
        }
        nav.navbar .navbar-brand {
            color: #ffffff;
            font-weight: bold;
        }

        nav.navbar .nav-link {
            color: #ffffff;
        }

        nav.navbar .dropdown-menu {
            min-width: 10rem;
        }

        .category-card {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }

        .category-card:hover {
            transform: scale(1.05);
        }

        .category-card img {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            width: 100%;
            height: 150px;
            object-fit: cover;
        }

        .category-card .card-body {
            padding: 1rem;
            text-align: center;
        }

        .category-card .card-title {
            font-weight: bold;
        }

        .category-card .btn {
            margin-top: 10px;
        }

        #carouselExampleAutoplaying {
            height: 550px;
        }

        .carousel-inner img {
            height: 100%;
            object-fit: cover;
        }

        .carousel-control-prev-icon,
        .carousel-control-next-icon {

        }

        .carousel-indicators button {
            background-color: rgba(0, 0, 0, 0.5); /* Adjust indicator color */
            border: none;
        }

        .carousel-indicators .active {
            background-color: #007bff; /* Active indicator color */
        }

        .carousel-inner img {
            object-fit: cover; /* Ensures the images are well-cropped */
            height: 550px; /* Set a fixed height for uniformity */
        }
    </style>
</head>
<body>

<%
    // Retrieve the user's role and name from the session
    String userRole = (String) session.getAttribute("userRole");
    String userName = (String) session.getAttribute("userName");
%>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand" href="customerDashboard.jsp">Core Clothing</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="customerDashboard.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Products</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Category
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Men</a></li>
                        <li><a class="dropdown-item" href="#">Women</a></li>
                        <li><a class="dropdown-item" href="#">Kids</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Cart</a>
                </li>
                <%-- Conditionally display Admin dropdown if the role is "admin" --%>
                <% if ("admin".equals(userRole)) { %>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Admin
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Manage Users</a></li>
                        <li><a class="dropdown-item" href="addProduct.jsp">Manage Products</a></li>
                        <li><a class="dropdown-item" href="#">Reports</a></li>
                    </ul>
                </li>
                <% } %>
            </ul>
            <form class="d-flex me-3" role="search">
                <input class="form-control me-2" type="search" placeholder="Search products..." aria-label="Search">
                <button class="btn btn-outline-light" type="submit">Search</button>
            </form>
            <div class="dropdown">
                <a class="btn btn-light dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <%= userName != null ? userName : "Guest" %>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item" href="#">Profile</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#" onclick="confirmLogout()">Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<!-- JavaScript for Logout Confirmation -->
<script>
    function confirmLogout() {
        // Show a confirmation dialog
        const confirmAction = confirm("Are you sure you want to log out?");
        if (confirmAction) {
            // Redirect to the logout servlet
            window.location.href = "logout";
        }
    }
</script>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9gyb1f1thK9a7v6f94B9XcDtrPKVPeYl2X25F3a28wvsx1z5d9L" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-kQ0iYVcP9oJd2Djp7cpKOSuK8VUBb0lfp6oq3oX74kj5rB7wpbdbilD25rgkK0xa" crossorigin="anonymous"></script>

</body>
</html>

