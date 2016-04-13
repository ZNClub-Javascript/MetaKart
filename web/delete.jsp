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
    <title>Delete Products</title>
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
                            category: {
                                identifier: 'category',
                                rules: [
                                    {
                                        type   : 'empty',
                                        prompt : 'Please enter a category for your product'
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
                <img src="img/story_carrots.png" class="image">

                <div class="content">
                    Delete Products
                </div>
            </h2>
        </center>
        <form id="form" class="ui large form" method="post" action="/delete">
            <div class="ui stacked segment">
                <div class="field">
                    <div class="ui left icon input">
                        <i class="user icon"></i>
                        <input type="text" name="id" placeholder="Enter Product ID">
                    </div>
                </div>

                <input type="submit" class="ui fluid large teal submit button" value="Delete"/>
            </div>

            <div class="ui error message"></div>

        </form>

    </div>
</div>
</body>
</html>
