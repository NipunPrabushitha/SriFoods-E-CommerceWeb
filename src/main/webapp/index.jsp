<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            margin: 0;
        }
        .bg-cover {
            background-image: url('images/9721228.jpg'); /* Replace with your image path */
            background-size: cover;
            background-position: center;
            height: 100vh;
        }
        .login-card {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="#">Sri Foods</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <button class="btn btn-outline-dark me-2" onclick="window.location.href='login.jsp'">Login</button>
            <button class="btn btn-dark" onclick="window.location.href='register.jsp'">Sign In</button>
        </div>
    </div>
</nav>

<div class="bg-cover d-flex justify-content-center align-items-center">
    <div class="card login-card p-5 bg-white" style="max-width: 500px;">
        <h3 class="text-center mb-4">Login</h3>
        <form action="loginServlet" method="post">
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
                <label for="username">Username</label>
            </div>
            <div class="form-floating mb-3">
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                <label for="password">Password</label>
            </div>
            <button type="submit" class="btn btn-dark w-100">Login</button>
        </form>
        <p class="text-center mt-3"> <a href="forgetPassword.jsp">Forget Password?</a></p>
        <p class="text-center mt-3">Don't have an account? <a href="register.jsp">Register here</a></p>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
