<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        /* Navbar */
        .navbar {
            background-color: #007bff;
            padding: 15px;
            color: white;
            font-size: 20px;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
        }

        /* Hero Section */
        .hero {
            padding: 50px 20px;
            background-color: white;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            margin: 20px;
            border-radius: 10px;
        }

        .hero h2 {
            color: #333;
        }

        .hero p {
            color: #555;
            font-size: 18px;
        }

        /* Buttons */
        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            display: inline-block;
            border-radius: 5px;
            margin-top: 15px;
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        Payment | <a href="login.jsp">Login</a> | <a href="Registration.jsp">Register</a>
    </div>

    <!-- Hero Section -->
    <div class="hero">
        <h2>Welcome to Payment</h2>
        <p>Secure & Fast Digital Payments</p>
        <a href="Registration.jsp" class="btn">Get Started</a>
    </div>

</body>
</html>