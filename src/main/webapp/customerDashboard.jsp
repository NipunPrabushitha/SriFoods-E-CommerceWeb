<%--
  Created by IntelliJ IDEA.
  User: nipun
  Date: 1/22/25
  Time: 12:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-commerce Platform</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
            </ul>
            <form class="d-flex me-3" role="search">
                <input class="form-control me-2" type="search" placeholder="Search products..." aria-label="Search">
                <button class="btn btn-outline-light" type="submit">Search</button>
            </form>
            <div class="dropdown">
                <a class="btn btn-light dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    John Doe
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item" href="#">Profile</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>


<!-- Moving Images Carousel -->
<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
    <div class="carousel-inner">
        <!-- First Image -->
        <div class="carousel-item active">
            <img src="images/woman-model-business-suit-wearing-hat(1)(1).jpg" class="d-block w-100" alt="Slide 1">
        </div>
        <!-- Second Image -->
        <div class="carousel-item">
            <img src="images/pexels-bohlemedia-1884581.jpg" class="d-block w-100" alt="Slide 2">
        </div>
        <!-- Third Image -->
        <div class="carousel-item">
            <img src="images/two-attractive-brunette-women-dressed-warm-clothes-posing-studio.jpg" class="d-block w-100" alt="Slide 3">
        </div>
    </div>

    <!-- Carousel Controls (optional) -->
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev" aria-label="Previous slide">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next" aria-label="Next slide">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>

    <!-- Carousel Indicators (optional) -->
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
</div>

<!-- Main Content: Categories -->
<div class="container my-5">
    <h2 class="text-center mb-4 mb-4 text-light fw-bold">Shop by Category</h2>
    <div class="row g-4">
        <!-- Category Card 1 -->
        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="category-card">
                <img src="images/men-category.jpg" alt="Men Category">
                <div class="card-body">
                    <h5 class="card-title">Men</h5>
                    <p class="card-text">Explore our latest collection for men.</p>
                    <a href="#" class="btn btn-primary">Shop Now</a>
                </div>
            </div>
        </div>

        <!-- Category Card 2 -->
        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="category-card">
                <img src="images/women-category.jpg" alt="Women Category">
                <div class="card-body">
                    <h5 class="card-title">Women</h5>
                    <p class="card-text">Discover trending styles for women.</p>
                    <a href="#" class="btn btn-primary">Shop Now</a>
                </div>
            </div>
        </div>

        <!-- Category Card 3 -->
        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="category-card">
                <img src="images/kids-category.jpg" alt="Kids Category">
                <div class="card-body">
                    <h5 class="card-title">Kids</h5>
                    <p class="card-text">Adorable styles for kids.</p>
                    <a href="#" class="btn btn-primary">Shop Now</a>
                </div>
            </div>
        </div>

        <!-- Category Card 4 -->
        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="category-card">
                <img src="images/accessories-category.jpg" alt="Accessories Category">
                <div class="card-body">
                    <h5 class="card-title">Accessories</h5>
                    <p class="card-text">Complete your look with accessories.</p>
                    <a href="#" class="btn btn-primary">Shop Now</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Dashboard: Category-wise Item Cards -->
<div class="container my-5">
    <h2 class="text-center mb-4 text-light fw-bold">Our Collection</h2>

    <!-- Category: Men -->
    <h3 class="mt-4 text-light fw-bold">Men's Collection</h3>
    <div class="row g-4">
        <!-- Item 1 -->
        <div class="col-lg-2 col-md-4 col-sm-6">
            <div class="card">
                <img src="images/men-item1.jpg" class="card-img-top" alt="Men Item 1">
                <div class="card-body">
                    <h5 class="card-title">Men's T-Shirt</h5>
                    <p class="card-text">Comfortable cotton t-shirt for casual wear.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="#" class="btn btn-primary">Shop Now</a>
                        <span class="text-muted">$30</span>
                    </div>
                </div>
            </div>
        </div>
        <!-- Item 2 -->
        <div class="col-lg-2 col-md-4 col-sm-6">
            <div class="card">
                <img src="images/men-item2.jpg" class="card-img-top" alt="Men Item 2">
                <div class="card-body">
                    <h5 class="card-title">Men's Jeans</h5>
                    <p class="card-text">Stylish jeans perfect for everyday wear.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="#" class="btn btn-primary">Shop Now</a>
                        <span class="text-muted">$50</span>
                    </div>
                </div>
            </div>
        </div>
        <!-- Item 3 -->
        <div class="col-lg-2 col-md-4 col-sm-6">
            <div class="card">
                <img src="images/men-item3.jpg" class="card-img-top" alt="Men Item 3">
                <div class="card-body">
                    <h5 class="card-title">Men's Jacket</h5>
                    <p class="card-text">Stylish leather jacket for all seasons.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="#" class="btn btn-primary">Shop Now</a>
                        <span class="text-muted">$120</span>
                    </div>
                </div>
            </div>
        </div>
        <!-- Item 4 -->
        <div class="col-lg-2 col-md-4 col-sm-6">
            <div class="card">
                <img src="images/men-item4.jpg" class="card-img-top" alt="Men Item 4">
                <div class="card-body">
                    <h5 class="card-title">Men's Sneakers</h5>
                    <p class="card-text">Comfortable and stylish sneakers for every occasion.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="#" class="btn btn-primary">Shop Now</a>
                        <span class="text-muted">$80</span>
                    </div>
                </div>
            </div>
        </div>
        <!-- Item 5 -->
        <div class="col-lg-2 col-md-4 col-sm-6">
            <div class="card">
                <img src="images/men-item5.jpg" class="card-img-top" alt="Men Item 5">
                <div class="card-body">
                    <h5 class="card-title">Men's Watch</h5>
                    <p class="card-text">Elegant and timeless wristwatch for men.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="#" class="btn btn-primary">Shop Now</a>
                        <span class="text-muted">$150</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Category: Women -->
    <h3 class="mt-4 text-light fw-bold">Women's Fashion</h3>
    <div class="row g-4">
        <!-- Item 1 -->
        <div class="col-lg-2 col-md-4 col-sm-6">
            <div class="card">
                <img src="images/women-item1.jpg" class="card-img-top" alt="Women Item 1">
                <div class="card-body">
                    <h5 class="card-title">Women's Dress</h5>
                    <p class="card-text">Elegant dress perfect for formal events.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="#" class="btn btn-primary">Shop Now</a>
                        <span class="text-muted">$90</span>
                    </div>
                </div>
            </div>
        </div>
        <!-- Item 2 -->
        <div class="col-lg-2 col-md-4 col-sm-6">
            <div class="card">
                <img src="images/women-item2.jpg" class="card-img-top" alt="Women Item 2">
                <div class="card-body">
                    <h5 class="card-title">Women's Blouse</h5>
                    <p class="card-text">Chic and comfortable blouse for work and play.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="#" class="btn btn-primary">Shop Now</a>
                        <span class="text-muted">$45</span>
                    </div>
                </div>
            </div>
        </div>
        <!-- Item 3 -->
        <div class="col-lg-2 col-md-4 col-sm-6">
            <div class="card">
                <img src="images/women-item3.jpg" class="card-img-top" alt="Women Item 3">
                <div class="card-body">
                    <h5 class="card-title">Women's Skirt</h5>
                    <p class="card-text">Trendy skirt with a modern design.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="#" class="btn btn-primary">Shop Now</a>
                        <span class="text-muted">$40</span>
                    </div>
                </div>
            </div>
        </div>
        <!-- Item 4 -->
        <div class="col-lg-2 col-md-4 col-sm-6">
            <div class="card">
                <img src="images/women-item4.jpg" class="card-img-top" alt="Women Item 4">
                <div class="card-body">
                    <h5 class="card-title">Women's Handbag</h5>
                    <p class="card-text">Stylish and spacious handbag for daily use.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="#" class="btn btn-primary">Shop Now</a>
                        <span class="text-muted">$70</span>
                    </div>
                </div>
            </div>
        </div>
        <!-- Item 5 -->
        <div class="col-lg-2 col-md-4 col-sm-6">
            <div class="card">
                <img src="images/women-item5.jpg" class="card-img-top" alt="Women Item 5">
                <div class="card-body">
                    <h5 class="card-title">Women's Shoes</h5>
                    <p class="card-text">Comfortable and stylish shoes for any occasion.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="#" class="btn btn-primary">Shop Now</a>
                        <span class="text-muted">$60</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Repeat for other categories (Kids, Accessories, Shoes, Sale) -->
    <!-- You can add the same structure for other categories, just change the images, titles, and descriptions accordingly -->
</div>


<!-- Footer -->
<footer class="bg-dark text-white py-4 mt-5">
    <div class="container text-center">
        <div class="row">
            <div class="col-md-4">
                <h5>About Us</h5>
                <p>We are dedicated to offering the best quality products for men, women, and kids. Our goal is to provide you with the latest fashion trends at affordable prices.</p>
            </div>
            <div class="col-md-4">
                <h5>Contact</h5>
                <p>Email: support@eshop.com</p>
                <p>Phone: +1 (800) 123-4567</p>
            </div>
            <div class="col-md-4">
                <h5>Follow Us</h5>
                <a href="#" class="text-white me-3"><i class="fab fa-facebook-f"></i> Facebook</a>
                <a href="#" class="text-white me-3"><i class="fab fa-twitter"></i> Twitter</a>
                <a href="#" class="text-white"><i class="fab fa-instagram"></i> Instagram</a>
            </div>
        </div>
        <hr class="my-4" />
        <p>&copy; 2025 E-Shop. All rights reserved.</p>
    </div>
</footer>

<!-- Font Awesome for social media icons -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>