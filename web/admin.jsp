<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.apache.catalina.User"%>
<%@page import="java.util.List"%>
<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <style>
        body {
            background-color: #f0f0f0;
            color: #333;
            font-family: Arial, sans-serif;
            margin: 0;
            padding-top: 10px;
        }

         h2 {
        text-align: center;
        margin-top: 10px;
        color: #4CAF50;
    }

    a {
        color: #4CAF50;
        text-decoration: none;
        transition: color 0.3s;
    }

    a:hover {
        color: #45a049;
    }

    #logout {
        float: right; /* Align the Logout button to the right */
        margin-top: 10px; /* Add some top margin for spacing */
        padding: 10px;
        color: #fff;
        background-color: #d9534f;
        text-decoration: none;
        border-radius: 4px;
    }

        #update, #delete {
            padding: 6px 12px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            cursor: pointer;
        }

        #update {
            background-color: #5bc0de;
            color: #fff;
            border: none;
        }

        #delete {
            color: #d9534f;
            text-decoration: none;
            cursor: pointer;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            font-size: 14px;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:hover {
            background-color: #e6e6e6;
        }

        /* Form Styling */
        form {
            margin-bottom: 20px;
        }

        input[type="text"] {
            padding: 10px;
            width: 200px;
        }

        input[type="submit"] {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        .error {
            color: #ff0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
        <c:redirect url="login.html"></c:redirect>
    </c:if>

    <h2>Welcome: ${sessionScope.LOGIN_USER.fullName}</h2>

    <c:url var="logoutLink" value="MainController">
        <c:param name="action" value="Logout"></c:param>
    </c:url>

    <a id="logout" href="${logoutLink}">Logout</a>

    <form action="MainController">
        Search <input type="text" name="search" value="${param.search}"/>
        <input type="submit" name="action" value="Search"/>
    </form>

    <c:if test="${requestScope.LIST_USER != null}">
        <c:if test="${not empty requestScope.LIST_USER}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>User ID</th>
                        <th>Full Name</th>
                        <th>Role ID</th>
                        <th>Password</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">
                        <form action="MainController" method="POST">
                            <tr>
                                <td>${counter.count}</td>
                                <td><input type="text" name="userID" value="${user.userID}" readonly=""/></td>
                                <td><input type="text" name="fullName" value="${user.fullName}" required=""/></td>
                                <td><input type="text" name="roleID" value="${user.roleID}" readonly=""/></td>
                                <td>${user.password}</td>
                                <td>
                                    <input type="submit" name="action" value="Update" id="update"/>
                                    <input type="hidden" name="search" value="${param.search}"/>
                                </td>
                                <td>
                                    <c:url var="deleteLink" value="MainController">
                                        <c:param name="action" value="Delete"></c:param>
                                        <c:param name="search" value="${param.search}"></c:param>
                                        <c:param name="userID" value="${user.userID}"></c:param>
                                    </c:url>
                                    <a id="delete" href="${deleteLink}">Delete</a>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </c:if>
    ${requestScope.ERROR}
</body>
</html>
