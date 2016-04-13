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
            background-size: cover;
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
                    })
            ;
            $('.ui.radio.checkbox').checkbox();
        });
    </script>
    <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="ui center aligned grid" style="padding-top: 55px">
    <div class="four wide column">
        <h2 class="ui teal image header">
            <img src="img/favicon.png.png" class="image">

            <div class="content">
                Sign up for the hottest deals!
            </div>
        </h2>
        <form id="form" class="ui large form" method="post" action="/signUpController">
            <div class="ui stacked segment">
                <div class="field">
                    <div class="ui left icon input">
                        <i class="user icon"></i>
                        <input id="emailid" type="text" name="email" placeholder="E-mail address">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="lock icon"></i>
                        <input type="password" name="password" placeholder="Password">
                    </div>
                </div>
                <div class="inline fields">
                    <label>User Type</label>
                    <div class="field">
                        <div class="ui radio checkbox">
                            <input type="radio" name="user-type" value="1">
                            <label>Farmer</label>
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui radio checkbox">
                            <input type="radio" name="user-type" value="0">
                            <label>Customer</label>
                        </div>
                    </div>
                </div>
                <div class="g-recaptcha" data-sitekey="6Lc7RA8TAAAAAHDh4WnW8GHdnxrdEL7iaujXNaz7"></div>
                <input type="submit" class="ui fluid large teal submit button" value="sign up!"/>
            </div>

            <div class="ui error message"></div>

        </form>

        <div class="ui message button" onclick="window.location.href='/resetInit?email='+$('#emailid').val()">
            Forgot your password? Reset it here!</a>
        </div>
    </div>
</div>
</body>
</html>
