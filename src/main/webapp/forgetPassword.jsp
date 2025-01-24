<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #2b5876, #4e4376);
            min-height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            padding: 20px;
            max-width: 500px;
            width: 100%;
        }

        .btn-primary {
            background: linear-gradient(135deg, #4e4376, #2b5876);
            border: none;
            border-radius: 8px;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #2b5876, #4e4376);
        }

        .form-section {
            display: none;
        }

        .form-section.active {
            display: block;
        }
    </style>
</head>
<body>
<%@include file="loginNavbar.jsp"  %>
<div class="container">
    <h4 class="text-center">Forgot Password</h4>
    <p class="text-center text-muted">Recover your account in two simple steps.</p>

    <!-- Display error message -->
    <%
        String error = request.getParameter("error");
        if (error != null) {
    %>
    <div class="alert alert-danger" role="alert">
        <%= error %>
    </div>
    <%
        }
    %>

    <!-- Step 1: Enter Email -->
    <form id="emailForm" action="ForgotPasswordServlet" method="POST" class="form-section active">
        <div class="mb-3">
            <label for="email" class="form-label">Email Address</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Send Verification Code</button>
    </form>

    <!-- Step 2: Verify Code -->
    <form id="verifyForm" action="ForgotPasswordServlet" method="POST" class="form-section">
        <div class="mb-3">
            <label for="code" class="form-label">Verification Code</label>
            <input type="text" class="form-control" id="code" name="code" placeholder="Enter the code sent to your email" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Verify Code</button>
    </form>
</div>

<script>
    // JavaScript to toggle between steps
    const emailForm = document.getElementById("emailForm");
    const verifyForm = document.getElementById("verifyForm");

    // Show verification step after submitting email
    emailForm.addEventListener("submit", function (e) {
        e.preventDefault();
        fetch(emailForm.action, {
            method: emailForm.method,
            body: new URLSearchParams(new FormData(emailForm))
        }).then(response => response.text()).then(data => {
            if (data === "success") {
                emailForm.classList.remove("active");
                verifyForm.classList.add("active");
            } else {
                alert("Failed to send verification code. Please try again.");
            }
        }).catch(err => {
            console.error("Error:", err);
        });
    });
</script>
</body>
</html>
