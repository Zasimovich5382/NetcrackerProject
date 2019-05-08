<#include "security.ftl">
<link rel="stylesheet" href="/static/css/header.css">
<header style="margin-bottom: 10px">
    <nav>
            <ul>
                <li>
                    <a href="/templates/mainPage.html">Home
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                    </a>
                </li>
                <#if isArtist>
                <li>
                    <a href="/artist/${user.getId()}">Public
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                    </a>
                </li>
                </#if>
                <#if isUser>
                <li>
                    <a href="/userLibrary">Library
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                    </a>
                </li>
                </#if>
                <li style="float: right;margin-right: 40px">
                <#if isUser>
                    <a id="logout">Log Out
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                    </a>
                <#else>
                    <a href="/templates/registration.html">Log In
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                    </a>
                </#if>
                </li>
                <li style="float: right;margin-right: 0">
                    <a href="/search">Search
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                    </a>
                </li>
                <li style="float: right;margin-right: 320px">
                    <a href="/templates/mainPage.html" ><img src="../static/images/play.png" width="33" height="34"></a>
                </li>
            </ul>
    </nav>
</header>
<script src="/static/js/header.js"></script>