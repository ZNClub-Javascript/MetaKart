<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FarmFresh</title>
    <link rel="shortcut icon" type="image/png" href="img/favicon.png"/>
    <link rel="stylesheet" href="semantic-ui/semantic.css">
    <style>
        @import url(https://fonts.googleapis.com/css?family=Roboto+Slab:700);

        body {
            background-size: cover;
            background: #8BC34A linear-gradient(to bottom, rgba(34, 34, 34, 1), rgba(255, 255, 255, 0) 10%) no-repeat;
        }

        .indigo {
            background-color: #3F51B5;
        }

        #main {
            position: relative;
            margin-top: 20px;
        }

        .offer {
            position: relative;
            top: 0;
            background: url(img/vegetables.jpg) fixed no-repeat;
            background-size: cover;
            height: 100%;
            overflow: hidden;
        }

        .offer .content {
            width: 75%;
            position: absolute;
            top: 25%;
            right: 0;
            font-family: 'Roboto Slab', serif;
            font-weight: 700;
            color: rgba(255, 255, 255, 0.7);
            font-size: 74pt;
            line-height: 20vh;
            text-align: right;
        }
    </style>
    <script src="jquery.js"></script>
    <script src="semantic-ui/semantic.min.js"></script>
    <script>
        $(function () {
            var scroll;
            $(window).on('scroll', function () {
                scroll = $(window).scrollTop();
                $('.offer .content').css("transform", "translateY(" + scroll / 2 + "px)");
            });
            $('.ui.rating')
                    .rating()
            ;
            //$('#main').visibility({
            //    onTopVisible: function(calculations) {
            //     window.scrollTo(0, $('#main').offset().top);
            // }});
        });
    </script>
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="offer">
    <div class="content">The best deals on the freshest vegetables are back!</div>
</div>

<div id="main" class="ui grid container">
    <div class="ui fluid cards">
        <div class="ui card">
            <div class="image">
                <img src="img/onions.jpg">
            </div>
            <div class="content">
                <a class="header">Onions</a>

                <div class="meta">
                    <span class="date">Hoarded for you</span>
                </div>
                <div class="ui mini star rating"  data-max-rating="5" data-rating="3"></div>
                <div class="left floated meta">
                    Rs. 40/kg
                </div>
                <div class="ui right floated basic blue button">
                    Buy
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
                    Tomatoes are red juicy and delicious.
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

<%@include file="footer.jsp" %>
</body>
</html>
