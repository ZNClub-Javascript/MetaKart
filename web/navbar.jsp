<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(function () {
        $('#logIn').popup({
            inline: true,
            hoverable: true,
            position: 'bottom right'
        });
    })
</script>
<div class="ui fixed sticky secondary inverted menu" style="background-color: #7CB342; padding: 5px">
    <a class="active item">Home</a>
    <a class="item">My Cart</a>
    <a class="item">Leafy Veggies</a>
    <a class="item">Non-Leafy Veggies</a>

    <div class="right menu">
        <a id="logIn" class="ui button" style="background: #9CCC65">log in</a>

        <div class="ui popup">
            <form class="ui form">
                <div class="field">
                    <label>Username</label>

                    <div class="ui input">
                        <input type="text" name="username" placeholder="Username">
                    </div>
                </div>
                <div class="field">
                    <label>Password</label>

                    <div class="ui input">
                        <input type="password" name="password" placeholder="Password">
                    </div>
                </div>
                <div class="ui bottom attached button" tabindex="0" style="background: #9CCC65">Log-in/Sign Up</div>
            </form>
        </div>
    </div>
</div>