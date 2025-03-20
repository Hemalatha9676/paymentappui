<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register on Payment</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #eef2f3;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
  }

  .form-box {
    background: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    width: 350px;
    text-align: center;
  }

  h2 {
    color: #333;
  }

  label {
    display: block;
    text-align: left;
    margin: 2px;
    color: #555;
    font-weight: bold;
  }

  input[type="text"], input[type="password"], input[type="email"], input[type="tel"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }

  input[type="submit"] {
    background: #28a745;
    color: white;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    width: 100%;
    font-size: 16px;
  }

  input[type="submit"]:hover {
    background: #218838;
  }
</style>
</head>
<body>
<div class="form-box">
    <h2>Register on Payment</h2>
    <form action="Registration" method="post">
      <label for="username">Username</label>
      <input type="text" id="username" name="username" required>

      <label for="firstname">First Name</label>
      <input type="text" id="firstname" name="firstname" required>

      <label for="lastname">Last Name</label>
      <input type="text" id="lastname" name="lastname" required>

      <label for="password">Password</label>
      <input type="password" id="password" name="password" required>

      <label for="email">Email</label>
      <input type="email" id="email" name="email" required>

      <label for="phone">Phone Number</label>
      <input type="tel" id="phone" name="phonenumber" required>

      <label for="address">Address</label>
      <input type="text" id="address" name="address" required>

      <input type="submit" value="Create Account">
    </form>
    <div class="login-link">
			Already have an account? <a href="login.jsp">Login here</a>
		</div>
</div>
</body>
</html>

