<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FarmFresh</title>
    <link rel="shortcut icon" type="image/png" href="img/favicon.png"/>
    <link rel="stylesheet" href="semantic-ui/semantic.css">
    <script src="semantic-ui/semantic.min.js"></script>
</head>
<style>
    body {
        background-size: cover;
        background: #212121 linear-gradient(to bottom, rgba(34, 34, 34, 1), rgba(255, 255, 255, 0) 10%) no-repeat;
    }

    .indigo {
        background-color: #3F51B5;
    }

    #main {
        margin-top: 20px;
    }
</style>
<body>
<%@ include file="navbar.jsp"%>
<div id="main" class="ui grid container">
    <div class="ui cards">
        <div class="ui card">
            <div class="image">
                <img src="img/onions.jpg">
            </div>
            <div class="content">
                <a class="header">Onions</a>

                <div class="meta">
                    <span class="date">Hoarded for you</span>
                </div>
                <div class="description">
                    I love onions
                </div>
            </div>
            <div class="extra content">
                <a>
                    <i class="user icon"></i>
                    22 Customers
                </a>
            </div>
        </div>
        <div class="ui card">
            <div class="image">
                <img src="img/tomatoes.jpg">
            </div>
            <div class="content">
                <a class="header">Tomatoes</a>

                <div class="meta">
                    <span class="date">In Stock</span>
                </div>
                <div class="description">
                    Tomatoes are red jucy and delicious.
                </div>
            </div>
            <div class="extra content">
                <a>
                    <i class="user icon"></i>
                    5 Sellers
                </a>
            </div>
        </div>
        <div class="ui card">
            <div class="image">
                <img src="img/broccoli.jpg">
            </div>
            <div class="content">
                <a class="header">Broccoli</a>

                <div class="meta">
                    <span class="date">Not in Stock</span>
                </div>
                <div class="description">
                    How about some tasty greens!
                </div>
            </div>
            <div class="extra content">
                <a>
                    <i class="user icon"></i>
                    2 eaters!
                </a>
            </div>
        </div>
        <div class="ui card">
            <div class="image">
                <img src="img/peppers.jpg">
            </div>
            <div class="content">
                <a class="header">Bell Peppers</a>

                <div class="meta">
                    <span class="date">Almost over</span>
                </div>
                <div class="description">
                    Much Hot such pungency.
                </div>
            </div>
            <div class="extra content">
                <a>
                    <i class="user icon"></i>
                    22 hot mouths!!
                </a>
            </div>
        </div>
        <div class="ui card">
            <div class="image">
                <img src="img/cabbage.jpg">
            </div>
            <div class="content">
                <a class="header">Cabbage</a>

                <div class="meta">
                    <span class="date">In Stock</span>
                </div>
                <div class="description">
                    Peal my layers.
                </div>
            </div>
            <div class="extra content">
                <a>
                    <i class="user icon"></i>
                    22 layers
                </a>
            </div>
        </div>
        <div class="ui card">
            <div class="image">
                <img src="img/mushrooms.jpg">
            </div>
            <div class="content">
                <a class="header">Mushrooms</a>

                <div class="meta">
                    <span class="date">About to arrive</span>
                </div>
                <div class="description">
                    How about a healthy high?
                </div>
            </div>
            <div class="extra content">
                <a>
                    <i class="user icon"></i>
                    10 marios down!
                </a>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
