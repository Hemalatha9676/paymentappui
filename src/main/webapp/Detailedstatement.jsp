<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Statement Request Page</title>
    
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
            color: orange;
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
            color: orange;
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

        /* Checkbox Styles */
        .checkbox-group {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 10px 0;
        }

        .checkbox-group input {
            margin-right: 5px;
        }

        .checkbox-group label {
            color: orange;
            font-weight: bold;
            margin-right: 15px;
        }

        /* Submit Button */
        .submit-btn {
            background-color: red;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 20px;
            cursor: pointer;
            display: block;
            margin: auto;
        }

        .submit-btn:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>

    <div class="header">Statement Request Page</div>

    <div class="container">
        <form action="generateStatement.jsp" method="post">
            <div class="form-group">
                <label for="startDate">Start DATE:</label>
                <input type="date" id="startDate" name="startDate" required>
            </div>
            <div class="form-group">
                <label for="endDate">END DATE:</label>
                <input type="date" id="endDate" name="endDate" required>
            </div>
            
            <div class="checkbox-group">
                <input type="checkbox" id="all" name="transactionType" value="all">
                <label for="all">ALL</label>

                <input type="checkbox" id="credit" name="transactionType" value="credit">
                <label for="credit">Credit Txns</label>

                <input type="checkbox" id="debit" name="transactionType" value="debit">
                <label for="debit">Debit Txns</label>

                <input type="checkbox" id="wallet" name="transactionType" value="wallet">
                <label for="wallet">Wallet Txns</label>

                <input type="checkbox" id="bank" name="transactionType" value="bank">
                <label for="bank">Bank Txns</label>
            </div>

            <div class="form-group">
                <button type="submit" class="submit-btn">GENERATE</button>
            </div>
        </form>
    </div>

</body>
</html>
