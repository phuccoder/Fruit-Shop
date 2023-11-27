<%-- 
    Document   : create
    Created on : Feb 25, 2023, 10:13:46 AM
    Author     : PHUC
--%>

<%@page import="user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Create Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4; /* Light gray background color */
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
        }

        form {
            width: 300px;
            margin: 0 auto;
            padding-top: 50px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
         
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            font-size: 14px;
            box-sizing: border-box;
        }

        input[type="submit"],
        input[type="reset"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 14px;
            border-radius: 4px;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <h1>Create New Account</h1>
    <c:set var="userError" value="${requestScope.USER_ERROR}" />
    <c:if test="${userError == null}">
        <c:set var="userError" value="<%= new UserError() %>" />
    </c:if>
    <form action="MainController" method="POST">
        User ID<input type="text" name="userID" required=""/><span class="error-message">${requestScope.USER_ERROR.userIDError}</span>
        </br>
        Full name<input type="text" name="fullName" required=""/><span class="error-message">${requestScope.USER_ERROR.fullNameError}</span>
        </br>
        Role ID<input type="text" name="roleID" value="US" readonly=""/></br>
        Password <input type="password" name="password" required=""/></br>
        Confirm <input type="password" name="confirm" required=""/><span class="error-message">${requestScope.USER_ERROR.confirmError}</span>
        </br>
        </br>
        <input type="submit" name="action" value="Create"/>
        <input type="reset" value="Reset"/>
    </form>
    ${userError.error}
</body>
</html>
