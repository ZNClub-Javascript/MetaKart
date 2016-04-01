<%@ page import="model.Cart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Cart</title>
    <link rel="shortcut icon" type="image/png" href="img/favicon.png"/>
    <link rel="stylesheet" href="semantic-ui/semantic.css">
    <style>
        body {
            background: url(img/OnlineShopping1.jpg) fixed no-repeat;
            background-size: cover;
        }
    </style>
    <script src="jquery.js"></script>
    <script src="semantic-ui/semantic.min.js"></script>
    <script>
        $(function () {
            $('.ui.form')
                    .form({
                        fields: {
                            username: {
                                identifier: 'card',
                                rules: [
                                    {
                                        type   : 'exactLength[16]',
                                        prompt : 'Please enter a valid card number'
                                    }
                                ]
                            },
                            password: {
                                identifier: 'cvv',
                                rules: [
                                    {
                                        type   : 'exactLength[3]',
                                        prompt : 'Please enter 3 digit CVV number'
                                    }
                                ]
                            }
                        }
                    })
            ;
            $('.ui.radio.checkbox').checkbox();
        });
    </script>
</head>
<body>
<div class="ui container">
    <div class="ui segment">
        <div class="ui two column grid">
            <div class="column">
                <div class="ui fluid relaxed divided list">
                <%
                    try {
                        Cart c = (Cart) request.getSession().getAttribute("cart");
                        String l[] = c.getItems();
                        String p[]= c.getCosts();

                        for(int i = 0;i<l.length;i++){
                %>
                    <div class="item">
                        <div class="right floated content">
                            <div class="ui red tag label">Rs. <%=p[i]%></div>
                        </div>
                        <div class="content">
                            <div class="description"><%=l[i]%></div>
                        </div>
                    </div>
                <%
                        }} catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                </div>
            </div>
            <div class="column">
                <form class="ui form segment" action="/checkout" method="post">
                    <div class="two fields">
                        <div class="field">
                            <label>Credit Card</label>
                            <input name="card" type="text" placeholder="16-digit number">
                        </div>
                        <div class="field">
                            <label>CVV</label>
                            <input name="cvv" type="text" placeholder="3-digit CVV">
                        </div>
                    </div>
                    <div class="inline fields">
                        <label>User Type</label>
                        <div class="field">
                            <div class="ui radio checkbox">
                                <input type="radio" name="user-type" value="1">
                                <label>Cash On Delivery</label>
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui radio checkbox">
                                <input type="radio" name="user-type" value="0">
                                <label>Credit Card</label>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="ui submit button" value="Pay!"/>
                    <div class="ui error message"></div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
