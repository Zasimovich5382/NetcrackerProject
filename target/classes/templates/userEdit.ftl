<#import "parts/common.ftl" as c>
<@c.page "/static/css/userEditPage.css">
<body style="background-image: url(../static/images/background_siginin.jpg)">
   <#include "parts/header.ftl">
<main>
    <div class="mainform">
        <form action="/user" method="post">
            <p class="p2">Change name:</p>
            <div class="form-group">
                <input type="text" name="username" value="${user.username}" class="form-control" id="changeName"  style="margin-left: 2.5em; width: 82%">
            </div>
            <div class="form-group">
            <#list roles as role>
                <div>
                    <label style="margin-left: 2.5em; width: 82%"><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
                </div>
            </#list>
            </div>
            <input type="hidden" value="${user.id}" name="userId">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button type="submit" class="btn btn-primary" style="background-color: crimson; border-color: white; margin-left: 40%; margin-bottom: 2em;">Save</button>
        </form>
    </div>
</main>
</body>
</@c.page>