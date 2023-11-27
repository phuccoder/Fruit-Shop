<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Fruits Store</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h1, h2 {
            color: #333;
            text-align: center;
        }

        h2 {
            color: #666;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 20px;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
        }
        
        .alert {
            background-color: #f44336;
            color: white;
            padding: 8px;
            margin-bottom: 20px;
        }
        
        .cart-table {
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <h1>Fruits Store</h1>
    <h2>Choose your fruit: </h2>
    <form action="MainController" method="POST">
        <input type="submit" name="action" value="View"/>
    </form>

    <form action="MainController" method="POST">
        <table border="1">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.FRUITS_LIST}" var="fruit">
                    <form action="CartAddController">
                        <tr>
                            <td>${fruit.productID} <input type="hidden" name="productID" value="${fruit.productID}"/></td>
                            <td>${fruit.productName}</td>
                            <td>${fruit.price} đ</td>
                            <td><input type="number" name="quantity" min="1" max="10" value="1"/></td>
                            <td><input type="submit" name="action" value="AddToCart"/></td>
                        </tr>
                    </form>
                </c:forEach>
            </tbody>
        </table>
    </form>

    <c:if test="${not empty MESSAGE}">
        <div class="alert alert-success">
            ${MESSAGE}
        </div>
    </c:if>

    <c:if test="${not empty requestScope.cartItems}">
        <h2>Cart</h2>
        <table class="cart-table">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.cartItems}" var="cartItem">
                    <tr>
                        <td>${cartItem.productID}</td>
                        <td>${cartItem.productName}</td>
                        <td>${cartItem.price}</td>
                        <td>${cartItem.quantity}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</body>
</html>
