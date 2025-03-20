<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payments Web App</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            width: 80%;
            max-width: 1200px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Header */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 20px;
            border-bottom: 2px solid #eee;
        }

        .header h2 {
            font-size: 28px;
            color: #4CAF50;
            margin: 0;
        }

        .logout {
            background-color: #f44336;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 6px;
            transition: background-color 0.3s;
        }

        .logout:hover {
            background-color: #d32f2f;
        }

        /* Balance Section */
        .balance-section {
            background-color: #e8f5e9; /* Light Green Background */
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border: 2px solid #4CAF50; /* Green border */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .balance-details {
            font-size: 18px;
            color: #333;
        }

        .send-money-btn {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border-radius: 6px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .send-money-btn:hover {
            background-color: #388e3c;
        }

        /* Bank Accounts */
        .bank-accounts {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .bank-card {
            background-color: #f1f8e9; /* Light Greenish Background */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
            border: 2px solid #8bc34a; /* Light Green border */
        }

        .bank-card:hover {
            transform: translateY(-5px);
        }

        .bank-card h4 {
            font-size: 22px;
            color: #4CAF50;
        }

        .bank-card p {
            font-size: 16px;
            color: #555;
        }

        .addbankaccount {
            text-align: center;
            background-color: #fbc02d;
            padding: 10px;
            border-radius: 8px;
            color: #333;
            font-size: 18px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .addbankaccount:hover {
            background-color: #f57f17;
        }

        /* Transactions */
        .transactions {
            background-color: #fff3e0; /* Light Orange Background */
            padding: 20px;
            border-radius: 10px;
            margin-top: 30px;
            border: 2px solid #ff9800; /* Orange border */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .transactions h4 {
            font-size: 22px;
            color: #333;
            margin-bottom: 15px;
        }

        .transaction-list p {
            font-size: 16px;
            color: #555;
            margin-bottom: 8px;
        }

        .detailed-stmt {
            display: inline-block;
            background-color: #00796b;
            color: white;
            padding: 10px;
            border-radius: 6px;
            text-decoration: none;
            margin-top: 15px;
            transition: background-color 0.3s;
        }

        .detailed-stmt:hover {
            background-color: #004d40;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header Section -->
        <div class="header">
            <h2>Payments Web App</h2>
            <p>Welcome <%= session.getAttribute("userFullName") %></p>
            <a href="logout.jsp" class="logout">Logout</a>
        </div>

        <!-- Balance Section -->
        <% HttpSession hs = request.getSession();
        String uname = (String) hs.getAttribute("uname"); %>
        <div class="balance-section">
            <div class="balance-details">
                <h3>Welcome, <span><%= uname %></span></h3>
                <p>Primary Bank Account No: 1234</p>
                <p><strong>Account Balance:</strong> ₹8000.00</p>
                <p><strong>Wallet Balance:</strong> ₹2000.00</p>
            </div>
            <a href="sendMoney.jsp">
                <button class="send-money-btn">Send Money</button>
            </a>
        </div>

        <!-- Bank Details -->
        <div class="bank-accounts">
            <div class="bank-card">
                <h4>State Bank</h4>
                <p><strong>Bank Acct No:</strong> 1234</p>
                <p><strong>Balance:</strong> ₹XXXXX</p>
                <p><strong>IFSC Code:</strong> XXXXXX</p>
                <p><strong>Branch:</strong> XXXXX</p>
                <a href="Edit.jsp" class="addbankaccount">Edit</a>
            </div>

            <div class="bank-card">
                <a href="AddBank.jsp" class="addbankaccount">[+] Add New Bank Account</a>
            </div>
        </div>

        <!-- Transactions -->
        <div class="transactions">
            <h4>Recent 10 Transactions</h4>
            <div class="transaction-list">
                <p>₹2000 sent to RAJU</p>
                <p>₹1200 received from LATHA</p>
                <p>₹5000 received from Sister</p>
                <p>...</p>
                <a href="DetailedStatement" class="detailed-stmt">Detailed Statement</a>
            </div>
        </div>
    </div>
</body>
</html>
