<#import "parts/common.ftl" as c>
<@c.page "/static/css/all.css">
<body style="background-image: url(../static/images/background_siginin.jpg)">
<main>
    ${message?ifExists}
    <div class="mainform">
        <p class="p1">Sign Up</p>
        <form action="/registration" method="post">
            <div class="form-group">
                <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email address" style="margin-left: 2.5em; width: 82%">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="username" id="exampleInputPassword3" placeholder="Name" style="margin-left: 2.5em; width: 82%">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name="password" id="exampleInputPassword1" placeholder="Password" style="margin-left: 2.5em; width: 82%">
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="form-group">
                <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Repeat Password" style="margin-left: 2.5em; width: 82%">
            </div>
            <div class="form-group form-check" style="margin-left: 2.5em">
                <input type="checkbox" class="form-check-input" id="exampleCheck1" >
                <label class="form-check-label" for="exampleCheck1">Remember me</label>
            </div>
            <button type="submit" class="btn btn-primary" style="background-color: crimson; border-color: white; margin-left: 40%">Sign Up!</button>
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
</@c.page>
