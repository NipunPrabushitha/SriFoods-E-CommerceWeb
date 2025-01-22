<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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

        .container {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            width: 100%;
            margin: auto;
        }

        h4 {
            font-weight: bold;
            margin-bottom: 1rem;
            color: #333333;
        }

        .form-control {
            border-radius: 8px;
            border: 1px solid #ccc;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            border-color: #4e4376;
            box-shadow: 0 0 5px rgba(78, 67, 118, 0.5);
        }

        .btn-primary {
            border-radius: 8px;
            padding: 0.8rem;
            font-size: 1rem;
            font-weight: bold;
            background: linear-gradient(135deg, #4e4376, #2b5876);
            border: none;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #2b5876, #4e4376);
        }

        .text-muted {
            font-size: 0.9rem;
            color: #666666;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<%@include file="loginNavbar.jsp"  %>

<div class="container">
    <h4 class="text-center">Forgot Password?</h4>
    <p class="text-center text-muted mb-4">Enter your email address to reset your password.</p>
    <form action="processForgetPassword" method="POST">
        <div class="mb-3">
            <label for="email" class="form-label">Email Address</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Send Reset Link</button>
    </form>
    <div class="text-center mt-4">
        <p>Remembered your password? <a href="index.jsp" class="text-decoration-none">Login</a></p>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
