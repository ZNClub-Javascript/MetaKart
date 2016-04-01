<%--
  Created by IntelliJ IDEA.
  User: fwarr
  Date: 19-Oct-15
  Time: 3:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${product.category}: ${product.name}</title>
    <link rel="stylesheet" href="semantic-ui/semantic.css">
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="ui container">
    <div class="ui segment">
        <div class="ui two column centered grid">
            <div class="column">
                <div class="ui medium rounded image">
                    <img src="${product.image}">
                </div>
            </div>
            <div class="column" style="text-align: center">
                <h3 class="ui center floated">${product.name}
                </h3>
                <div class="ui relaxed divided list">
                    <div class="item">
                        <div class="content">
                            <div class="header">Description:</div>
                            <div class="description">${product.description}
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="content">
                            <div class="header">Price:</div>
                            <div class="description">${product.price}
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="content">
                            <div class="header">Stock Left:</div>
                            <div class="description">${product.stock}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
