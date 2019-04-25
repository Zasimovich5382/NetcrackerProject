<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>
<@c.page "/static/css/userLibrary.css">
<body style="background-color: #202020">
    <#include "parts/header.ftl">
<main>
    <div class="blocktop" style="background-image: url(../static/images/COM-Lucy-Peach-Homepage.jpg)">
        <a href="/userPageEdit/${id}"><button type="button" class="btn btn-primary" style="background-color: crimson; margin-left: 90%; border-color: #171717; margin-top: 2em;">Edit Page</button></a>
        <p class="p1">${name}</p>
    </div>
    <div class="mainblock-back">
        <div class="mainblock">
            <p class="p2">Your Library:</p>
            <a href="/addPlaylist"><button type="button" class="btn btn-primary" style="background-color: crimson; margin-left: 5%; border-color: #171717; margin-top: 2em;">Add Playlist</button></a>
            <table style="margin-bottom: 3em; padding-left: auto">
            <#list playlistes as playlist>
                <tr>
                    <td>
                        <div class="card" style="width: 18rem; margin-left: 4em; margin-top: 1em; margin-bottom: 2em">
                            <a href="/templates/userLibrarySongs.html">
                                <#if playlist.img_name??>
                                    <img src="/img/${playlist.img_name}" class="card-img-top" alt="card" width="200" height="200">
                                <#else>
                                    <img src="/img/noname.jpg" class="card-img-top" alt="card" width="200" height="200">
                                </#if>
                            </a>
                            <div class="card-body">
                                <h5 class="card-title">${playlist.title}</h5>
                                <p class="card-text">Listen all your favorite songs. Shuffled?</p>
                            </div>
                        </div>
                    </td>
                </tr>
            </#list>
            </table>
        </div>
    </div>
</main>
</@c.page>