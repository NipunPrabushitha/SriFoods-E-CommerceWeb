<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms & Conditions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #2b5876, #4e4376);
            color: #ffffff;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            margin: 5% auto;
            padding: 2rem;
            max-width: 800px;
            color: #333333;
        }

        h1 {
            text-align: center;
            font-weight: bold;
            color: #4e4376;
        }

        p {
            line-height: 1.6;
        }

        ul {
            padding-left: 1.5rem;
        }

        li {
            margin-bottom: 1rem;
        }

        a {
            color: #2b5876;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<%@include file="loginNavbar.jsp"  %>

<div class="container">
    <h1>Terms & Conditions</h1>
    <p>Welcome to Core Clothing! By accessing or using our website, you agree to abide by the following terms and conditions. Please read them carefully.</p>

    <h4>1. General Use</h4>
    <p>
        By using this site, you confirm that you are at least 18 years old or have parental consent to access and use the services. You agree not to use the site for any unlawful purposes.
    </p>

    <h4>2. Account Responsibilities</h4>
    <p>
        When you create an account with us, you are responsible for maintaining the confidentiality of your login details and all activities under your account.
    </p>

    <h4>3. Intellectual Property</h4>
    <p>
        All content on this site, including text, images, graphics, and designs, is the property of Core Clothing or its licensors. Unauthorized use or distribution is prohibited.
    </p>

    <h4>4. Prohibited Activities</h4>
    <ul>
        <li>Using the website to distribute harmful or illegal content.</li>
        <li>Attempting to breach the website's security systems.</li>
        <li>Impersonating other users or entities.</li>
    </ul>

    <h4>5. Termination</h4>
    <p>
        We reserve the right to terminate or suspend your access to the site without notice if you violate any terms.
    </p>

    <h4>6. Limitation of Liability</h4>
    <p>
        Core Clothing shall not be held liable for any damages arising from your use of the site, including but not limited to direct, indirect, incidental, or consequential damages.
    </p>

    <h4>7. Changes to Terms</h4>
    <p>
        We may update these terms from time to time. Continued use of the site implies acceptance of the revised terms.
    </p>

    <h4>8. Contact Us</h4>
    <p>
        If you have any questions about these terms, please contact us at <a href="mailto:support@coreclothing.com">support@coreclothing.com</a>.
    </p>

    <p class="text-center mt-4"><a href="registration.jsp" class="btn btn-primary">Back to Signup</a></p>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
