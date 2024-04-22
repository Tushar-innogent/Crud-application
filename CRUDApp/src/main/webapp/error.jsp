<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .error-container {
            max-width: 600px;
            margin: 100px auto;
            text-align: center;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #e74c3c;
        }
        p {
            margin-top: 20px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Oops! Something went wrong.</h1>
        <p>Error Message : 
        <%= request.getAttribute("errorMsg") %>
        </p>
        <p>We're sorry to inform you that an error occurred while processing your request.</p>
		<p>Please try again later or contact support if the problem persists.</p>
		<a href="/index.jsp" class="btn">Go back to Home</a>
</div>

</body>
</html>