<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page "/static/css/userEditPage.css">
<body style="background-image: url(../static/images/background_siginin.jpg)">
   <#include "parts/header.ftl">
<main>
    <div class="mainform">
        <form action="/addPlaylist" method="post" enctype="multipart/form-data">
            <p class="p2">Name:</p>
            <div class="form-group">
                <input type="text" name="title" value="MyAlbum" class="form-control"  style="margin-left: 2.5em; width: 82%">
            </div>
            <div class="form-group">
                <input type="file" name="file" class="form-control"  style="margin-left: 2.5em; width: 82%">
            </div>
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button type="submit" class="btn btn-primary" style="background-color: crimson; border-color: white; margin-left: 40%; margin-bottom: 2em;">Save</button>
        </form>
    </div>
</main>
</@c.page>