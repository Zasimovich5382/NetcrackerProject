<#import "parts/common.ftl" as c>
<@c.page "/static/css/playlist.css">
<body style="background-color: #202020"><#include "parts/header.ftl">
<main>
    <div class="blocktop">
        <table>
            <tr>
                <td class="playlistImage" style='background-image: url("/img/${playlist.img_name}")'></td>
                <td class="playlistInfoBack" style="width: 60%">
                    <p class="p1">${user.nickname} <cite class="cite">Indie</cite></p>
                    <p class="p2">Calm are ready for the end of the winter. Aren't you?</p>
                    <a href="/templates/user.html"><p class="p4">Editor - Emmie James</p></a>
                    <a href="http://www.facebook.com" style="margin-left: 2em;"><img src="/static/images/IMG_9004.PNG" style="width: 3em; height: 3em;"></a>
                    <a href="http://www.twitter.com" style="margin-left: 0.5em;"><img src="/static/images/IMG_9005.PNG" style="width: 3em; height: 3em;"></a>
                    <a href="http://www.vk.com" style="margin-left: 0.5em;"><img src="/static/images/IMG_9006.PNG" style="width: 3em; height: 3em;"></a>
                </td>
                <td></td>
            </tr>
        </table>
    </div>
    <div class="mainblock-back">
        <p class="p3">Songs in the playlist:</p>
        <div class="mainblock">
            <button type="button" class="btn btn-danger" style="margin-left: 3em; margin-top: 2em;">Play all  <img src="/static/images/play.png" width="20" height="20"></button>
            <button type="button" class="btn btn-danger" style="margin-top: 2em;">Shuffle  <img src="/static/images/shuffle.png" width="20" height="20"></button>
            <ul class="list-group" style="margin-left: 3em; padding-top: 1em; margin-right: 3em; padding-bottom: 3em;">
                <#list playlist.getSongs() as song>
                    <li class="list-group-item active" style="background-color: crimson; border-color: white"><audio style="background-color: crimson; border-color: white" src="/img/${song.song_name}" controls></audio></li>
                </#list>
            </ul>
        </div>
    </div>
    <script src="/static/js/playlist.js"></script>
</main>
</@c.page>