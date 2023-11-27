<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>CheckOut</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4; /* Light gray background color */
            margin: 0;
            padding: 10px;
        }
        
        .welcome {
            color: red;
            font-size: 20px;
            font-weight: bold;
        }
        
        .logout-form, .login-form {
            margin-top: 10px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        
        th {
            background-color: #f2f2f2;
            padding: 8px;
            text-align: left;
        }
        
        td {
            padding: 8px;
        }
        
        a {
            color: blue;
            text-decoration: none;
        }
        
        a:hover {
            color: red;
        }
        
        h1 {
            color: red;
            margin-top: 10px;
        }
        
        h3 {
            color: green;
            margin-top: 10px;
        }
        
        form {
            margin-top: 10px;
        }
        
        input[type="text"] {
            padding: 8px;
            width: 300px;
            margin-bottom: 10px;
        }
        
        input[type="submit"], input[type="reset"] {
            padding: 10px 20px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-right: 10px;
        }
        
        input[type="reset"] {
            background-color: #f44336;
        }
        
        .error-message {
            color: red;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <c:set var="fullname" value="${sessionScope.LOGIN_USER.fullName}"/>
    <c:if test="${not empty fullname}">
        <div class="welcome">
            <font color="red">Welcome</font> ${fullname}
            <form action="MainController">
                <input type="submit" value="Logout" />
            </form>
        </div>
    </c:if>
    <c:if test="${empty sessionScope.LOGIN_USER}">
        <div class="logout-form">
            <form action="MainController">
                <input type="submit" value="Logout" />
            </form>
            <br/>
        </div>
    </c:if>
    
    <c:set var="checkout_items" value="${requestScope.ITEMS_IN_CHECKOUT}"/>
    <c:if test="${not empty checkout_items}">
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${checkout_items}" varStatus="counter">
                    <c:set var="total" value="${item.value * item.key.price}"></c:set>
                    <tr>
                        <td>${counter.count}</td>
                        <td>${item.key.productID}</td>                                    
                        <td>${item.key.productName}</td>    
                        <td>${item.key.price} đ</td>
                        <td>${item.value}</td>
                        <td>${total} đ</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="3">
                        <a href="ShoppingController">Add More Fruits to Your Cart</a>
                    </td>
                    <td>
                        <a href="CartViewController">View Your Cart</a>
                    </td>
                    <td colspan="3">
                        Total Bill: ${requestScope.TOTAL_PRICE} đ
                    </td>
                </tr>
            </tbody>
        </table>
        
        <form action="CheckoutController" id="form">
            Your name <input type="text" name="txtCusName" value="${param.txtCusName}" /><br/>
            <c:if test="${not empty requestScope.ERROR.custNameIsNullError}">
                <div class="error-message">
                    ${requestScope.ERROR.custNameIsNullError}
                </div>
            </c:if>
            Your address <input type="text" name="txtCusAddress" value="${param.txtCusAddress}" /><br/>
            <c:if test="${not empty requestScope.ERROR.addressIsNullError}">
                <div class="error-message">
                    ${requestScope.ERROR.addressIsNullError}
                </div>
            </c:if>
            Your Phone <input type="text" name="txtCusPhone_no" value="${param.txtCusPhone_no}" /><br/>
            <c:if test="${not empty requestScope.ERROR.phoneNumberIsNullError}">
                <div class="error-message">
                    ${requestScope.ERROR.phoneNumberIsNullError}
                </div>
            </c:if>
            <input type="hidden" name="total_price" value="${requestScope.TOTAL_PRICE}" />
            <input type="submit" name="action" value="Confirm Checkout" />
            <input type="reset" value="Reset" />
        </form>                    
    </c:if>
    <c:if test="${empty checkout_items}">
        <h1>No Item In Cart!!!</h1>
        <c:if test="${not empty requestScope.CHECKOUT_SUCCESSFULLY}">
            <h3>${requestScope.CHECKOUT_SUCCESSFULLY}</h3>
        </c:if>
        <a href="ShoppingController">Back To Store</a>
    </c:if>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</body>
</html>
