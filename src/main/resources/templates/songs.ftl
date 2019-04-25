<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>
<@c.page "/static/css/userLibrary.css">
<body style="background-color: #202020">
<script>
    function doAjax(var song; var playlist;) {
        $.ajax({
            url:'aadSongToPlaylist',
            type : "POST",
            data:({song:song, playlist:playlist)
        });
    }

</script>
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
                            <div id="app">
                                <nav>
                                    <transition name="fade" mode="out-in">
                                        <i class="material-icons menu" v-if="!show" @click="show = !show" key="menu">menu</i>
                                        <i class="material-icons clear" v-else @click="show = !show" key="clear">clear</i>
                                    </transition>
                                    <transition name="fade">
                                        <ul v-if="show">
                                            <#list playlists as playlist>
                                                <p><i id="butt" @click="show = !show">${playlist.title}</i></p>
                                            <p><button onclick="doAjax(${song};${playlist})" id="btt">добавь</button></p>
                                            </#list>
                                        </ul>
                                    </transition>
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
</@c.page>