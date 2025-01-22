<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
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
            overflow: hidden;
            display: flex;
            max-width: 1100px;
            width: 100%;
            margin: auto;

        }

        .image-section {
            background: url('images/view-hawaiian-shirt-with-floral-print-sneakers(1).jpg') center/cover no-repeat;
            flex: 1;
        }

        .form-section {
            flex: 1;
            padding: 3rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background: #ffffff;
        }

        .form-section h4 {
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
    <!-- Image Section -->
    <div class="image-section d-none d-md-block"></div>

    <!-- Form Section -->

    <div class="form-section">
        <h4 class="text-center">Welcome Back!</h4>
        <p class="text-center text-muted mb-4">Please login to your account</p>
        <form action="login-servlet" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <input type="checkbox" id="remember" name="remember">
                    <label for="remember" class="text-muted">Remember Me</label>
                </div>
                <a href="forgetPassword.jsp" class="text-decoration-none">Forgot Password?</a>
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
        <div class="text-center mt-4">
            <p>Don't have an account? <a href="registration.jsp" class="text-decoration-none">Sign Up</a></p>
        </div>
    </div>
</div>

<!-- Error Modal -->
<div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="errorModalLabel">Login Error</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Invalid credentials. Please try again.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- Error and Success Modal -->
<div class="modal" tabindex="-1" id="errorModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Error</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p id="errorMessage">Invalid Credentials</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div class="modal" tabindex="-1" id="successModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Success</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p id="successMessage">Registration Successful</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const urlParams = new URLSearchParams(window.location.search);

    // Show error modal if error exists
    if (urlParams.has('error')) {
        const error = urlParams.get('error');
        const errorMessage = document.getElementById('errorMessage');
        errorMessage.textContent = error; // Set error message
        const errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
        errorModal.show();
    }

    // Show success modal if success exists
    if (urlParams.has('success')) {
        const success = urlParams.get('success');
        const successMessage = document.getElementById('successMessage');
        successMessage.textContent = success; // Set success message
        const successModal = new bootstrap.Modal(document.getElementById('successModal'));
        successModal.show();
    }
</script>
</body>
</html>
