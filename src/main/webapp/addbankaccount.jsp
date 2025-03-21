<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Bank Account</title>
    
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        /* Header Styles */
        .header {
            font-size: 24px;
            font-weight: bold;
            color: red;
            margin: 20px auto;
            padding: 10px;
            border: 2px solid red;
            display: inline-block;
        }

        /* Container Styles */
        .container {
            width: 50%;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            border: 2px solid blue;
        }

        /* Form Group Styles */
        .form-group {
            margin: 10px 0;
            text-align: left;
        }

        .form-group label {
            display: inline-block;
            width: 200px;
            font-weight: bold;
            color: blue;
            text-align: right;
            padding-right: 10px;
        }

        .form-group input {
            width: 60%;
            padding: 8px;
            border: 1px solid blue;
            border-radius: 5px;
            font-size: 14px;
        }

        /* Submit Button */
        .submit-btn {
            background-color: blue;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            display: block;
            width: 100%;
        }

        .submit-btn:hover {
            background-color: darkblue;
        }
    </style>
</head>
<body>

    <div class="header">Add Bank Account</div>

    <div class="container">
        <form action="Addbankaccount" method="post">
            <div class="form-group">
                <label for="bankName">BANK NAME:</label>
                <input type="text" id="bankName" name="BankName" required>
            </div>
            <div class="form-group">
                <label for="accountNumber">ACCOUNT NUMBER:</label>
                <input type="text" id="accountNumber" name="AccountNumber" required>
            </div>
            <div class="form-group">
                <label for="accountType">ACCOUNT TYPE:</label>
                <input type="text" id="accountType" name="Accounttype" required>
            </div>
            <div class="form-group">
                <label for="ifscCode">IFSC CODE:</label>
                <input type="text" id="ifscCode" name="IFSCCODE" required>
            </div>
            <div class="form-group">
                <label for="currentBalance">CURRENT BALANCE:</label>
                <input type="number" id="currentBalance" name="Currentbalance" required>
            </div>
            <div class="form-group">
                <label for="pin">PIN:</label>
                <input type="password" id="pin" name="Pin" required>
            </div>
            <div class="form-group">
                <button type="submit" class="submit-btn">Add Account</button>
            </div>
        </form>
    </div>

</body>
</html>
