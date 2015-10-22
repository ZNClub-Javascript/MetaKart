<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(function () {
        $('#logIn').popup({
            inline: true,
            hoverable: true,
            position: 'bottom right'
        });
        $('#logOut').popup({
            inline: true,
            hoverable: true,
            position: 'bottom right'
        });
        $('.ui.search')
                .search({
                    apiSettings: {
                        url: '/search?q={query}'
                    }
                });
    })
</script>
<div class="ui fixed sticky secondary inverted menu" style="background-color: #7CB342; padding: 5px; height: 7%">
    <a class="active item">Home</a>
    <div class="item">
        <div class="ui search">
            <div class="ui inverted transparent icon input">
                <input class="prompt" type="text" placeholder="Check out what we have...">
                <i class="search icon"></i>
            </div>
            <div class="results"></div>
        </div>
    </div>

    <div class="right menu">
        <div class="item">
            <% if ((User) session.getAttribute("user") == null) {%>
            <a id="logIn" class="ui button" style="background: #9CCC65">log in</a>

            <div class="ui popup">
                <form class="ui form" method="post" action="${pageContext.request.contextPath}login">
                    <div class="field">
                        <label>Username</label>

                        <div class="ui input">
                            <input type="email" name="username" placeholder="Username">
                        </div>
                    </div>
                    <div class="field">
                        <label>Password</label>

                        <div class="ui input">
                            <input type="password" name="password" placeholder="Password">
                        </div>
                    </div>
                    <div class="field">
                        <input type="submit" class="ui bottom attached button" tabindex="0"
                               style="background: #9CCC65" value="Log in / Sign Up"/>
                    </div>
                </form>
            </div>
            <% } else {%>
            <div id="logOut" class="ui red label"><%=((User) session.getAttribute("user")).getUser()%>
            </div>
            <div class="ui inverted popup">
                <div class="ui inverted vertical menu">
                    <a href="#" class="item">My Cart<i class="blue cart icon"></i></a>
                    <a href="/logout" class="item">Log out<i class="green sign out icon"></i></a>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</div>