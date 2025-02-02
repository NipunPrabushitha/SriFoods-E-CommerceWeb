<%--
  Created by IntelliJ IDEA.
  User: nipun
  Date: 1/22/25
  Time: 10:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>NavBar</title>
    <style>
        body {
            background: linear-gradient(135deg, #2b5876, #4e4376);
            min-height: 100vh;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        nav.navbar {
            background: linear-gradient(135deg, #003135, #024950);
        }

        nav.navbar .navbar-brand {
            color: #ffffff;
        }

        nav.navbar .btn {
            border-radius: 8px;
        }
    </style>
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="index.jsp">Core Clothing</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <button class="btn btn-outline-light me-2" onclick="window.location.href='index.jsp'">Login</button>
            <button class="btn btn-light" onclick="window.location.href='registration.jsp'">Sign In</button>
        </div>
    </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
