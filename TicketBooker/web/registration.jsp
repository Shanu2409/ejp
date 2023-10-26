<%-- 
    Document   : registration
    Created on : Aug 22, 2023, 7:10:41 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <link rel="stylesheet" type="text/css" href="registration.css">
    </head>
    <body>
        <div class="container">
        <h2>Registration</h2>
        <form action="register" method="post">
            <label for="email">E-mail:</label>
            <input type="text" id="email" name="email" required>
            
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Register</button>
        </form>
    </div>
    </body>
</html>
