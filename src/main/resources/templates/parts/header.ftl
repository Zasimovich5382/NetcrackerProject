<#include "security.ftl">
<header>
    <nav class="navbar navbar-expand-lg navbar-light dark" style="background: #171717">
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                    <a class="nav-link" href="/templates/mainPage.html" style="color: white;">Home<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/templates/explorePage.html" style="color: white;">Explore</a>
                </li>
                <#if isUser>
                <li class="nav-item">
                    <a class="nav-link" href="/userLibrary" style="color: white;">Library</a>
                </li>
                </#if>
            </ul>
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0" style="display: inline; margin-right: auto">
                <a class="navbar-brand" href="/templates/mainPage.html" style="margin: auto"><img src="../static/images/play.png" width="33" height="34"></a>
            </ul>
            <a class="nav-link" href="/templates/search.html" style="color: white;">Search</a>
            <#if isUser>
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <a class="nav-link"><input type="submit" value="Sign Out"/></a>
            </form>
            <#else>
            <a class="nav-link" href="/templates/registration.html" style="color: white;">Log In</a>
            </#if>
            <div class="navbar-text" style="color: white;">${name}</div>
        </div>
    </nav>
</header>

