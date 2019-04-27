<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>
<@c.page "/static/css/userLibrary.css">
<body style="background-color: #202020">
    <#include "parts/header.ftl">
<main>
    <div class="mainblock-back">
        <div class="mainblock">
            <p class="p2">Your Library:</p>
            <table style="margin-bottom: 3em; padding-left: auto">
            <#list songs as song>
                <tr>
                    <td>
                        <div class="card" style="width: 18rem; margin-left: 4em; margin-top: 1em; margin-bottom: 2em">
                            <div class="card-body">
                                <h5 class="card-title">${song.song_name}</h5>
                            </div>
                            <div class="app">
                                <nav>
                                    <div class="addToPlaylist">
                                        <i class="material-icons menu">menu</i>
                                    <div>
                                        <ul class="sub-menu" style="overflow: visible; height: auto; opacity: 1;">
                                            <#list playlists as playlist>
                                                <li class="list">
                                                    <a class="btt" data-playlistid="${playlist.getId()}"
                                                            data-songid="${song.getId()}">
                                                    ${playlist.title}
                                                    </a>
                                                </li>
                                            </#list>
                                        </ul>
                                    </div>
                            </div>
                                </nav>
                            </div>
                        </div>
                    </td>
                </tr>
            </#list>
            </table>
        </div>
    </div>
</main>
<script src="/static/js/test.js"></script>
</@c.page>