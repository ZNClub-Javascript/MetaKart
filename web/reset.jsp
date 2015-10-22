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
    <title>Sign Up</title>
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
    <script>
        $(function () {
            $('.ui.form')
                    .form({
                        fields: {
                            username: {
                                identifier: 'email',
                                rules: [
                                    {
                                        type   : 'empty',
                                        prompt : 'Please enter a username'
                                    },
                                    {
                                        type   : 'email',
                                        prompt : 'Please valid email ID'
                                    }
                                ]
                            },
                            password: {
                                identifier: 'password',
                                rules: [
                                    {
                                        type   : 'empty',
                                        prompt : 'Please enter a password'
                                    },
                                    {
                                        type   : 'minLength[6]',
                                        prompt : 'Your password must be at least 6 characters'
                                    }
                                ]
                            }
                        }
                    });
        });
    </script>
</head>
<body>
<div class="ui center aligned grid">
    <div class="four wide column">
        <h2 class="ui teal image header">
            <img src="img/story_carrots.png" class="image">

            <div class="content">
                Everyone forgets things!
            </div>
        </h2>
        <form id="form" class="ui large form" method="post" action="/reset">
            <div class="ui stacked segment">
                <div class="field">
                    <div class="ui left icon input">
                        <i class="user icon"></i>
                        <input type="number" name="vcode" placeholder="Verification Code">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="lock icon"></i>
                        <input type="password" name="password" placeholder="New Password">
                    </div>
                </div>
                <input type="submit" class="ui fluid large teal submit button" value="reset!"/>
            </div>

            <div class="ui error message"></div>

        </form>

        <div class="ui message">
            Almost done!
        </div>
    </div>
</div>
</body>
</html>
