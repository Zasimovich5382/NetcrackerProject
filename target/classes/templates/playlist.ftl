<#import "parts/common.ftl" as c>
<@c.page "/static/css/playlist.css">
<body style="background-color: #202020"><#include "parts/header.ftl">
<main id="main" data-id="${playlist.getId()}">
    <div class="blocktop">
        <table>
            <tr>
                <td class="playlistImage" style='background-image: url("/img/${playlist.imgName}")'></td>
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
        <div class="playlist-wrapper">
            <h1 style="color: #fff">PLAYLIST</h1>
        <p class="p3">Songs in the playlist:</p>
        <div class="mainblock">
            <button type="button" class="btn btn-danger" style="margin-left: 3em; margin-top: 2em;">Play all  <img src="/static/images/play.png" width="20" height="20"></button>
            <button type="button" class="btn btn-danger" style="margin-top: 2em;">Shuffle  <img src="/static/images/shuffle.png" width="20" height="20"></button>
            <ul class="list-group" style="margin-left: 3em; padding-top: 1em; margin-right: 3em; padding-bottom: 3em;">
                <#list playlist.getSongs() as song>
                    <div id="${song.id}" data-duration="${song.metaDuration}" data-path="/sound/${song.songPath}" data-artist="${song.metaArtist}" data-title="${song.metaTitle}" class="playlist-item">
                            <div class="playlist-inner">
                                    <div class="playlist-play">
                                                    <img class="icon-play2 play-button2" src="/static/images/playmusic.png" style="width: 30px"></img>
                                                    <div class="playlist-duration">Img </div>
                                               </div>
                                            <div class="playlist-title">Name </div>
                                        </div>
                                <div class="playlist-meta">Time
                                </div>
                        </div>
                </#list>
            </ul>
        </div>
    </div>
    </div>
    <div id="playlist">
        <div class="player1">
            <div class="playlist-inner">
                <div class="playlist-play">
                    <img class="icon-play2 play-button" id="-1" src="../static/images/playmusic.png" style="width: 60px"></img>
                    <div class="playlist-duration" >Img </div>
                </div>
                <div class="playlist-title">Name </div>
            </div>
            <div class="settings1">
                <div class="sledbtn" id="pred" data-id="-1">◄</div> <!--Кнопка предыдущая песня-->
                <div class="sledbtn" id="sled" data-id="-1">►</div><!--Кнопка следующая песня-->
                <div class="mute">♪</div><!--Кнопка выключения/включения звука-->
                <input type="range" class="volume" min="0" max="100" value="100"><!--Регулятор громкости-->
            </div>
            <div class="bar">
                <div class="setTime"></div>
                <div class="range">
                    <div class="progress"></div>
                    <div class="load"></div>
                </div>
            </div>
            <div class="playlist-meta">
                    Time
            </div>
        </div>

    </div>
    <script src="/static/js/playlist.js"></script>
</main>
</@c.page>