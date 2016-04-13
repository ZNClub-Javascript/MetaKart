<%@ page import="java.sql.*" %>
<%@ page import="model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="cartApp">
<head>
    <title>MetaKart</title>
    <link rel="shortcut icon" type="image/png" href="img/favicon.png"/>
    <link rel="stylesheet" href="semantic-ui/semantic.css">
    <link rel="stylesheet" href="semantic-ui/transition.min.css">
    <link rel="stylesheet" href="semantic-ui/dimmer.min.css">
    <style>
        @import url(https://fonts.googleapis.com/css?family=Roboto+Slab:700);

        body {
            background-size: cover;
            background: #BF360C linear-gradient(to bottom, rgba(34, 34, 34, 1), rgba(255, 255, 255, 0) 10%) no-repeat;
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
            background: url(img/OnlineShopping1.jpg) fixed no-repeat;
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
            color: rgba(55, 71, 79, 1);
            font-size: 74pt;
            line-height: 20vh;
            text-align: right;
        }
    </style>
    <script src="jquery.js"></script>
    <script src="semantic-ui/semantic.min.js"></script>
    <script src="semantic-ui/transition.min.js"></script>
    <script src="semantic-ui/dimmer.min.js"></script>
    <script src="angular.min.js"></script>
    <script src="cart.js"></script>
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
            $('#mycart' +
                    '').click(function () {
                $('#modaldiv').modal('show');
            });
            $('.ui.dropdown')
                    .dropdown()
            ;
        });


    </script>

</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="offer">
    <% for (int i = 0; i < 2; i++) { %>
    <div class="content">The best deals on the latest products are back!</div>
    <%}%>
</div>
<div id="main" class="ui grid container" ng-controller="CartRefreshController">
    <div class="ui fluid search selection dropdown">
        <input type="hidden" name="country">
        <i class="dropdown icon"></i>
        <div class="default text">Select Country</div>
        <div class="menu">
            <div class="item" data-value="af"><i class="af flag"></i>Afghanistan</div>
            <div class="item" data-value="ax"><i class="ax flag"></i>Aland Islands</div>
            <div class="item" data-value="al"><i class="al flag"></i>Albania</div>
            <div class="item" data-value="dz"><i class="dz flag"></i>Algeria</div>
        </div>
    </div>
    <div class="ui centered fluid cards">
        <sql:setDataSource var="snapshot" driver="oracle.jdbc.driver.OracleDriver"
                           url="jdbc:oracle:thin:@//localhost:1521"
                           user="HR" password="HR"/>

        <sql:query dataSource="${snapshot}" var="result">
            SELECT * FROM PRODUCTS
        </sql:query>

        <c:forEach var="row" items="${result.rows}">

            <div class="ui card">
                <img class="ui medium image" src="${row.image}">
            <div class="content">
                <%
                    User u = (User) session.getAttribute("user");
                    if( u!= null && (u.getType()==1)){
                %>
                        <div class="meta">
                        <span class="date">${row.id}</span>
                        </div>
                <% } %>
                <a class="header">${row.name}</a>

                    <div class="meta">
                        <span class="date">${row.description}</span>
                    </div>
                    <div class="ui mini star rating" data-max-rating="5" data-rating="3"></div>
                    <div class="left floated meta">
                        Rs. ${row.price}/kg
                    </div>
                    <div class="right floated meta">
                            ${row.stock} Items
                    </div>
                </div>
                <div id="${row.id}" class="ui basic blue bottom attached button"
                     onclick="$.ajax('/cart?vid='+'${row.id}');$('#'+'${row.id}').removeClass('basic');">
                    +Add to cart
                </div>
            </div>
        </c:forEach>

    </div>
</div>

<%@include file="footer.jsp" %>
</body>
</html>
