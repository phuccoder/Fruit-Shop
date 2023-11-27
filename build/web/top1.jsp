<%-- 
    Document   : top1
    Created on : Jul 12, 2023, 1:14:54 PM
    Author     : PHUC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
       <body>
        <h1>Top 1 User:</h1>
        <table>
            <tr>
                <th>User ID</th>
                <th>Full Name</th>
                <th>Role ID</th>
            </tr>
            <c:if test="${not empty topUser}">
                <tr>
                    <td>${topUser.userID}</td>
                    <td>${topUser.fullName}</td>
                    <td>${topUser.roleID}</td>
                </tr>
            </c:if>
        </table>
    </body>
        
    
</html>
