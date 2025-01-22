<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Core Clothing - Get Started</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet"> <!-- Font Awesome -->
    <style>
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        .video-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
        }

        .header-content {
            text-align: center;
            color: #ffffff;
            margin-top: 2rem;
        }

        .header-content h1 {
            font-size: 3.5rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .header-content p {
            font-size: 1.2rem;
        }

        .footer-content {
            margin-bottom: 2rem;
        }

        .btn-primary {
            border-radius: 8px;
            padding: 0.8rem 2rem;
            font-size: 1.2rem;
            font-weight: bold;
            background: linear-gradient(135deg, #2b5876, #4e4376);
            border: none;
            display: inline-flex;
            align-items: center; /* Aligns the icon and text */
        }

        .btn-primary i {
            margin-left: 0.8rem; /* Adds space between the text and icon */
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #4e4376, #2b5876);
        }

        @media (max-width: 768px) {
            .header-content h1 {
                font-size: 2.5rem;
            }

            .header-content p {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>

<!-- Background Video -->
<video autoplay muted loop class="video-background">
    <source src="videos/videoplayback.mp4" type="video/mp4">
    Your browser does not support the video tag.
</video>

<!-- Overlay Content -->
<div class="overlay">
    <!-- Header Section -->
    <div class="header-content">
        <h1>Welcome to Core Clothing</h1>
        <p>Discover the finest apparel designed for every moment.</p>
    </div>

    <!-- Footer Section -->
    <div class="footer-content">
        <a href="login.jsp" class="btn btn-primary">
            SHOP NOW
            <i class="fas fa-arrow-right"></i> <!-- Font Awesome Arrow Icon -->
        </a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
