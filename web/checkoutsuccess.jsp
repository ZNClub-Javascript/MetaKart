<%--
  Created by IntelliJ IDEA.
  User: Varun
  Date: 10/28/2015
  Time: 11:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Success!</title>
  <link rel="stylesheet" href="semantic-ui/semantic.css">
  <script src="jquery.js"></script>
  <script src="semantic-ui/semantic.min.js"></script>
  <style>
    body {
      background: url(img/vegetables.jpg) fixed no-repeat;
    }

    .middle.center {
      position: fixed;
      top: 40%;
      left: 40%;
      width: 50%;
    }
  </style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="ui center aligned grid">
  <div class="four wide column">
    <h2 class="ui teal image header">
      <img src="img/cart.jpg" class="image">
      <div class="content">
        Order Confirmation
      </div>
    </h2>
    <div class="ui message">
        Your order has been successfully placed
    </div>
      <div class="ui fluid button">
          <a href="index.jsp">Continue Shopping</a>
      </div>
  </div>
</div>
</body>
</html>
