<%--
  Created by IntelliJ IDEA.
  User: fwarr
  Date: 28-Sep-15
  Time: 9:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Products Details</title>
    <link rel="stylesheet" href="semantic-ui/semantic.css">
    <script src="jquery.js"></script>
    <script src="semantic-ui/semantic.min.js"></script>
    <style>
        body {
            background: url(img/OnlineShopping1.jpg) fixed no-repeat;
            background-size: cover;
            height: 100%;
        }

        .middle.center {
            position: fixed;
            top: 40%;
            left: 40%;
            width: 50%;
        }
    </style>
    <script>
        $(function () {
            $('.ui.form')
                    .form({
                        fields: {
                            image: {
                                identifier: 'image',
                                rules: [
                                    {
                                        type   : 'empty',
                                        prompt : 'Please enter an image link'
                                    },

                                ]
                            },
                            name: {
                                identifier: 'name',
                                rules: [
                                    {
                                        type   : 'empty',
                                        prompt : 'Please enter a name for your product'
                                    }
                                ]
                            },
                            price: {
                                identifier: 'price',
                                rules: [
                                    {
                                        type   : 'empty',
                                        prompt : 'Please enter a price for your product'
                                    }
                                ]
                            },
                            stock: {
                                identifier: 'stock',
                                rules: [
                                    {
                                        type   : 'empty',
                                        prompt : 'Please enter your stock for the product'
                                    }
                                ]
                            },
                            id: {
                                identifier: 'category',
                                rules: [
                                    {
                                        type   : 'empty',
                                        prompt : 'Please enter Product ID'
                                    }
                                ]
                            }
                        }
                    });
        });
    </script>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="ui center aligned grid">
    <div class="four wide column">
        <center>
        <h2 class="ui teal image header">
            <img src="img/favicon.png" class="image">

            <div class="content">
                Edit Product Details
            </div>
        </h2>
        </center>
        <form id="form" class="ui large form" method="post" action="/edit">
            <div class="ui stacked segment">
                <div class="field">
                    <div class="ui left icon input">
                        <i class="user icon"></i>
                        <input type="text" name="id" placeholder="Enter Product ID">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="cubes icon"></i>
                        <input type="text" name="name" placeholder="Name">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="edit icon"></i>
                        <input type="text" name="desc" placeholder="Description">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="picture icon"></i>
                        <input type="url" name="image" placeholder="Image">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="money icon"></i>
                        <input type="number" name="price" placeholder="Price">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="cubes icon"></i>
                        <input type="number" name="stock" placeholder="Stock">
                    </div>
                </div>
                <input type="submit" class="ui fluid large teal submit button" value="Edit Item"/>
            </div>

            <div class="ui error message"></div>

        </form>

    </div>
</div>
</body>
</html>
