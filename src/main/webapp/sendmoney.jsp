<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send Money - Payments Web App</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .container {
            width: 80%;
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .header h2 {
            font-size: 28px;
            color: #4CAF50;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            font-size: 16px;
            color: #333;
            display: block;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        .form-group button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border-radius: 6px;
            border: none;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        .form-group button:hover {
            background-color: #388e3c;
        }
        .back-btn {
            background-color: #f44336;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 6px;
            display: inline-block;
            margin-top: 20px;
            text-align: center;
            transition: background-color 0.3s;
        }
        .back-btn:hover {
            background-color: #d32f2f;
        }
        .error {
            color: red;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
    <script>
        function toggleFields(source) {
            var accountField = document.getElementById("accountField");
            var walletField = document.getElementById("walletField");
            var accountCheckbox = document.getElementById("toAccount");
            var walletCheckbox = document.getElementById("toWallet");

            // Allow only one checkbox at a time
            if (source.checked) {
                if (source.id === "toAccount") {
                    walletCheckbox.checked = false;
                    accountField.style.display = "block";
                    walletField.style.display = "none";
                } else if (source.id === "toWallet") {
                    accountCheckbox.checked = false;
                    accountField.style.display = "none";
                    walletField.style.display = "block";
                }
            } else {
                accountField.style.display = "none";
                walletField.style.display = "none";
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Send Money</h2>
        </div>

        <% 
            // Retrieve the user's available balance from session
            Double accountBalance = (Double) session.getAttribute("accountBalance");
            if (accountBalance == null) {
                accountBalance = 0.0;
            }
        %>

        <form action="sendMoneyProcess.jsp" method="post">
            <div class="form-group">
                <label for="amount">Amount to Send (₹)</label>
                <input type="number" id="amount" name="amount" required placeholder="Enter amount to send" min="1" max="<%= accountBalance %>">
                <div class="error" id="amountError"></div>
            </div>

            <div class="form-group">
                <label>Transfer Type</label>
                <input type="checkbox" id="toAccount" name="transferType" value="account" onclick="toggleFields(this)">
                <label for="toAccount">To Bank Account</label>

                <input type="checkbox" id="toWallet" name="transferType" value="wallet" onclick="toggleFields(this)">
                <label for="toWallet">To Wallet Account</label>
            </div>

            <!-- Bank Account Number Field -->
            <div id="accountField" class="form-group" style="display: none;">
                <label for="recipientAccount">Recipient's Bank Account No.</label>
                <input type="text" id="recipientAccount" name="recipientAccount" placeholder="Enter recipient's bank account number">
            </div>

            <!-- Wallet Account Number Field -->
            <div id="walletField" class="form-group" style="display: none;">
                <label for="walletID">Recipient's Wallet Account No.</label>
                <input type="text" id="walletID" name="walletID" placeholder="Enter recipient's wallet account number">
            </div>

            <div class="form-group">
                <button type="submit">Send Money</button>
            </div>
        </form>

        <a href="index.jsp" class="back-btn">Back to Dashboard</a>
    </div>

    <script>
        document.querySelector('form').addEventListener('submit', function(event) {
            var amount = document.getElementById('amount').value;
            var errorDiv = document.getElementById('amountError');
            var maxAmount = <%= accountBalance %>;

            if (amount > maxAmount) {
                errorDiv.textContent = "You cannot send more than your available balance (₹" + maxAmount + ")";
                event.preventDefault();
            } else if (amount <= 0) {
                errorDiv.textContent = "Amount must be greater than zero.";
                event.preventDefault();
            } else {
                errorDiv.textContent = "";
            }

            // Ensure at least one transfer type is selected
            var accountChecked = document.getElementById("toAccount").checked;
            var walletChecked = document.getElementById("toWallet").checked;

            if (!accountChecked && !walletChecked) {
                alert("Please select a transfer type (Account or Wallet).");
                event.preventDefault();
            }

            // Ensure input fields are filled
            var accountNumber = document.getElementById("recipientAccount").value;
            var walletNumber = document.getElementById("walletID").value;

            if (accountChecked && accountNumber.trim() === "") {
                alert("Please enter a bank account number.");
                event.preventDefault();
            }
            if (walletChecked && walletNumber.trim() === "") {
                alert("Please enter a wallet account number.");
                event.preventDefault();
            }
        });

        toggleFields(document.getElementById("toAccount")); // Ensure the correct fields are displayed on page load
    </script>
</body>
</html>
