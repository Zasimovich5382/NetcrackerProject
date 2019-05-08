<#import "parts/common.ftl" as c>
<@c.page "/static/css/all.css">
<body style="background-image: url(/static/images/background_siginin.jpg)">
<main>
    <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
        <div class="alert alert-danger" role="alert">
            ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
        </div>
    </#if>
    <#if message??>
    <div class="alert alert-${messageType}" role="alert">
        ${message}
    </div>
    </#if>
    <div class="mainform">
        <div>
            <a href="/home" ><img src="/static/images/main.png" style="width: 50px;height: 50px; float: left; padding: 10px 10px" ></a>
            <p class="p1">Sign In</p>
        </div>
        <form action="/login" method="post" onsubmit="saveValues()">

            <div class="form-group">
                <input type="text" class="form-control ${(usernameError??)?string('is-invalid', '')}" name="username" id="inputName" aria-describedby="emailHelp" placeholder="Enter username" style="margin-left: 2.5em; width: 82%">
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
            </div>

            <div class="form-group">
                <input type="password" class="form-control ${(passwordError??)?string('is-invalid', '')}" name="password" id="inputPassword" placeholder="Password" style="margin-left: 2.5em; width: 82%">
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
            </div>

            <div class="form-group form-check" style="margin-left: 2.5em">
                <input type="checkbox" class="form-check-input" id="exampleCheck1" >
                <label class="form-check-label" for="checkBox">Remember me</label>
            </div>
            <button type="submit" id="sumbitButton" class="btn btn-primary" style="background-color: crimson; border-color: white; margin-left: 40%">Sign In!</button>
            <p class="p2">Or enter with:</p>
            <table>
                <tr>
                    <td>
                        <a href="http://www.facebook.com" style="margin-left: 8em;"><img src="/static/images/IMG_9004.PNG" style="width: 3em; height: 3em;"></a>
                    </td>
                    <td>
                        <a href="http://www.twitter.com" style="margin-left: 1em;"><img src="/static/images/IMG_9005.PNG" style="width: 3em; height: 3em;"></a>
                    </td>
                    <td>
                        <a href="http://www.vk.com" style="margin-left: 1em;"><img src="/static/images/IMG_9006.PNG" style="width: 3em; height: 3em;"></a>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <a href="/registration"><p class="p3">Don't have an account? Sign up</p></a>
        </form>
    </div>
</main>
<script src="/static/js/registration.js"></script>
</@c.page>