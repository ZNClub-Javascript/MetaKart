<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FarmFresh</title>
    <link rel="shortcut icon" type="image/png" href="img/favicon.png"/>
    <link rel="stylesheet" href="semantic-ui/semantic.css">
    <link rel="stylesheet" href="semantic-ui/transition.min.css">
    <link rel="stylesheet" href="semantic-ui/dimmer.min.css">
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
    <script src="semantic-ui/transition.min.js"></script>
    <script src="semantic-ui/dimmer.min.js">
    </script>
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
            $('#add').click(function () {
                $('#modaldiv').modal('show');
            });
        });


    </script>

</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="offer">
    <% for (int i = 0; i < 2; i++) { %>
    <div class="content">The best deals on the freshest vegetables are back!</div>
    <%}%>
</div>
<div id="modaldiv" class="ui modal">
    <i class="close icon"></i>

    <div class="header">
        My Cart
    </div>
    <div class="image content">
        <div class="image">
            <img height="300px" src="img/cart.jpg">

        </div>
        <div class="description">
            <div class="ui header">My Veggies</div>
        </div>
    </div>
    <div class="actions">
        <div class="ui button">Later</div>
        <div class="ui button">Proceed</div>
    </div>
</div>
<div id="main" class="ui grid container">
    <div class="ui fluid cards">
        <% try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521", "hr", "hr");
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM PRODUCTS");
            ResultSet resultSet = statement.executeQuery();
            System.out.println(resultSet.next());
            while (resultSet.next()) {
                System.out.println(resultSet.getString("NAME"));
        %>
        <div class="ui card">
            <div class="image">
                <img src="<%=resultSet.getString("IMAGE")%>">
            </div>
            <div class="content">
                <a class="header"><%=resultSet.getString("NAME")%></a>

                <div class="meta">
                    <span class="date"><%=resultSet.getString("DESCRIPTION")%></span>
                </div>
                <div class="ui mini star rating" data-max-rating="5" data-rating="3"></div>
                <div class="left floated meta">
                    Rs. <%=resultSet.getInt("PRICE")%>/kg
                </div>
                <div id="add" class="ui right floated basic blue test button">
                    <%=resultSet.getInt("STOCK")%> left: +Add to cart
                </div>
            </div>
            <div class="extra content">
                <a>
                    <i class="user icon"></i>
                    22 Customers
                </a>
            </div>
        </div>
        <%
                }
            } catch (ClassNotFoundException e) {
            e.printStackTrace();
            }
            catch (SQLException e)
            {
            e.printStackTrace();
            }
        %>

    </div>
</div>

<%@include file="footer.jsp" %>
</body>
</html>
