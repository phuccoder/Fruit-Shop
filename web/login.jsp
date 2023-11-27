<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
         body {
         background: linear-gradient(to bottom right, #2ecc71, #27ae60);
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
    }
        h1 {
            color: #333;
            text-align: center;
            margin-top: 20px;
        }

        .login-container {
            width: 300px;
            background-color: #fff;
            padding: 50px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 14px;
            margin-bottom: 15px;
        }

        .error-message {
            color: red;
            margin-top: 10px;
        }

        .submit-button,
        .reset-button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-right: 10px;
        }

        .reset-button {
            background-color: #f44336;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .create-user-link,
        .phuc-store-link {
            display: block;
            margin-top: 20px;
            text-align: center;
        }

        .create-user-link:hover,
        .phuc-store-link:hover {
            color: #065c87;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>LOGIN</h1>
        <form action="LoginController" method="POST" id="form">
            <label for="userID">User ID</label>
            <input type="text" name="userID" id="userID" required/><br>

            <label for="password">Password</label>
            <input type="password" name="password" id="password" required/><br>

            <div class="g-recaptcha" data-sitekey="6LeBiQMnAAAAADBN9lbZ8KJZ_Qb1ekJ0XQnCMii2"></div>

            <div id="error" class="error-message"></div>

            <div class="button-container">
                <input type="submit" name="action" value="Login" class="submit-button"/>
                <input type="reset" value="Reset" class="reset-button"/>
            </div>
        </form>

        <a href="MainController?action=CreatePage" class="create-user-link">Create new account</a>
        <br>
        <a href="MainController?action=shoppingPage" class="phuc-store-link">Phuc Store</a>
    </div>

    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script>
        window.onload = function () {
            const form = document.getElementById("form");
            const error = document.getElementById("error");

            form.addEventListener("submit", function (event) {
                event.preventDefault();
                const response = grecaptcha.getResponse();
                console.log(response);
                if (response) {
                    form.submit();
                } else {
                    error.innerHTML = "Please check captcha!!!";
                }
            });
        }
    </script>
</body>
</html>
