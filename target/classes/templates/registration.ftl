<#import "parts/common.ftl" as c>
<@c.page "/static/css/all.css">
<body style="background-image: url(../static/images/background_siginin.jpg)">
<main>
    ${message?ifExists}
    <div class="mainform">
        <div>
            <a href="/home" ><img src="/static/images/main.png" style="width: 50px;height: 50px; float: left; padding: 10px 10px" ></a>
            <p class="p1">Sign Up</p>
        </div>
        <form action="/registration" method="post" onsubmit="saveValues()">
            <div class="form-group">
                <input type="text" class="form-control ${(usernameError??)?string('is-invalid', '')}" name="username" value="<#if user??>${user.username}</#if>" id="inputName" placeholder="Name" style="margin-left: 2.5em; width: 82%">
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
            <div class="form-group">
                <input type="password" class="form-control ${(password2Error??)?string('is-invalid', '')}" name="password2" id="exampleInputPassword2" placeholder="Repeat Password" style="margin-left: 2.5em; width: 82%">
                <#if password2Error??>
                <div class="invalid-feedback">
                    ${password2Error}
                </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                       value="<#if user??>${user.email}</#if>" name="email" id="exampleInputEmail1"
                       aria-describedby="emailHelp" placeholder="Enter email address" style="margin-left: 2.5em; width: 82%">
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
            </div>
            <div class="form-group form-check" style="margin-left: 2.5em">
                <input type="checkbox" class="form-check-input" id="checkBox" >
                <label class="form-check-label" for="exampleCheck1">Remember me</label>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" class="btn btn-primary" id="sumbitButton" style="background-color: crimson; border-color: white; margin-left: 40%">Sign Up!</button>
            <p class="p2">Or enter with:</p>
            <table>
                <tr>
                    <td>
                        <a href="http://www.facebook.com" style="margin-left: 8em;"><img src="../static/images/IMG_9004.PNG" style="width: 3em; height: 3em;"></a>
                    </td>
                    <td>
                        <a href="http://www.twitter.com" style="margin-left: 1em;"><img src="../static/images/IMG_9005.PNG" style="width: 3em; height: 3em;"></a>
                    </td>
                    <td>
                        <a href="http://www.vk.com" style="margin-left: 1em;"><img src="../static/images/IMG_9006.PNG" style="width: 3em; height: 3em;"></a>
                    </td>
                </tr>
            </table>
            <a href="/login"><p class="p3">Already have an account? Sign in</p></a>
        </form>
    </div>
</main>
<script src="/static/js/registration.js"></script>
</@c.page>
