<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Your Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4; /* Light gray background color */
            margin: 0;
            padding-top: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            text-align: center;
            padding: 10px;
        }

        th {
            background-color: #e0e0e0;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ffc107;
        }

        h1 {
            color: red;
        }

        a {
            text-decoration: none;
            color: blue;
        }

        a:hover {
            color: purple;
        }

        .user-welcome {
            margin-bottom: 10px;
        }

        .logout-button {
            background-color: #d9534f;
            color: white;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="user-welcome">
        <c:set var="fullname" value="${sessionScope.LOGIN_USER.fullName}" />
        <c:if test="${not empty fullname}">
            <font color="red">Welcome</font> ${fullname}
            <form action="MainController">
                <input class="logout-button" type="submit" value="Logout" />
            </form>
        </c:if>
        <c:if test="${empty sessionScope.LOGIN_USER}">
            <form action="login.html">
                <input class="logout-button" type="submit" value="Logout" />
            </form>
            <br/>
        </c:if>
    </div>

    <c:set var="cart_items" value="${requestScope.ITEMS_IN_CART}" />
    <c:if test="${not empty cart_items}">
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Title</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Action</th>
                    <th></th>
                </tr>
            </thead>
            <form action="CartRemoveController">
                <tbody>
                    <c:forEach var="item" items="${cart_items}" varStatus="counter">
                        <c:set var="total" value="${item.value * item.key.price}" />
                        <tr>
                            <td>${counter.count}</td>
                            <td>${item.key.productName}</td>
                            <td>${item.key.price} đ</td>
                            <td>${item.value}</td>
                            <td>${total} đ</td>
                            <td><input type="checkbox" name="chkItem" value="${item.key.productID}" /></td>
                            <td></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="3">
                            <a href="ShoppingController">Add More</a>
                        </td>
                        <td colspan="2"></td>
                        <td>
                            <input type="submit" value="Remove" />
                        </td>
                        <td>
                            <a href="CheckoutViewController">CheckOut</a>
                        </td>
                    </tr>
                </tbody>
            </form>
        </table>

    </c:if>
    <c:if test="${empty cart_items}">
        <h1>No Item In Cart!!!</h1>
        <a href="ShoppingController">Back To Store</a>
    </c:if>
</body>
</html>
