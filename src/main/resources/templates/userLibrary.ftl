<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>
<@c.page "/static/css/userLibrary.css">
<body style="background-color: #202020">
    <#include "parts/header.ftl">
<main id="main">
    <div class="blocktop" id="backround" style="background-image: url(/img/${user.getBackground()})">
        <a><button type="button" onclick="show('block')" class="btn btn-primary" style="background-color: crimson; margin-left: 90%; border-color: #171717; margin-top: 2em;">Edit Page</button></a>
        <img id="avatarArtict" width="300px" height="300px" src="/img/${user.getAvatar()}" style = "border-radius: 50%; position: relative; z-index: 5; bottom: 30px; left: 100px"/>
        <div class="p1" id="nicknamelibrary" style="position: relative; left: 400px; bottom: 200px ">${nickname}</div>
    </div>
    <div class="mainblock-back">
        <div class="mainblock">
            <p class="p2">Your Library:</p>
            <button type="button" class="btn btn-primary" onclick="showAddPlaylist('block')" style="background-color: crimson; margin-right: 5%;float: right; border-color: #171717; margin-top: 2em;">Add Playlist</button>
            <table style="margin-bottom: 3em; padding-left: auto">
            <#list playlistes as playlist>
                <tr class="card1">
                    <td>
                        <div class="card" style="width: 18rem; margin-left: 4em; margin-top: 1em; margin-bottom: 2em">
                            <a href="/playlist/${playlist.id}">
                                <#if playlist.imgName??>
                                    <img src="/img/${playlist.imgName}" class="card-img-top" alt="card" width="200" height="200">
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
    <#-------------------------------------------------------------------задний прозрачный фон-------------------------------->
    <div id="gray" onclick="show('none');showAddPlaylist('none')"></div>
    <#-------------------------------------------------------------форма для редактирования информации о юзере-->
    <div id="mainform">
        <form id="postForm" enctype="multipart/form-data" method="POST">
            <div>
                <img src="/static/images/closemenu.png" style="width: 35px;height: 35px; float: right; padding: 10px 10px" onclick="show('none')">
            </div>
            <label for="changeBackground">
                <img src="/img/${user.getBackground()}" width="100%" height="200px" id="backgroundImg" style="z-index: 5;position: relative;">
            </label>
            <label for="changeAvatar">
                <img src="/img/${user.getAvatar()}" width="100px" height="100px" id="avatarImg" style="border-radius: 50%; z-index: 10;top: -140px; left: 50px;position: relative;">
            </label>
            <div style="position: relative;bottom: 130px">
            <div class="form-group">
                <p class="p7" style="display: inline-block;">Change name:</p>

                <input type="text" name="nickname" value="${user.nickname}" class="form-control" id="changeName"  style="margin-left: 2.5em; width: 82%">

                <p class="p7">Change email:</p>
                <input type="text" name="email" value="${user.email}" class="form-control" id="changeEmail"  style="margin-left: 2.5em; width: 82%">
                <p class="p7" style="display: inline-block;">Change city:</p>
                <input type="text" name="city" class="form-control" id="changeCity"  style="margin-left: 2.5em; width: 82%">
            </div>
            <div class="form-group">
                <ul>
                    <li class="checkboxForArtist" style="width:340px; float: left">
                        <i>Click if you want to become an artist and share your music with others.</i>
                    </li>
                    <li class="checkboxForArtist" style="float: right; margin-right: 80px">
                        <label ><input type="checkbox" id="checboxEditArtist" name="ARTIST" ${user.roles?seq_contains(ARTIST)?string("checked", "")}>ARTIST</label>
                    </li>
                </ul>
            </div>

            <input type="hidden" value="${user.id}" name="userId">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
                <input type="file" name="avatar" onchange="readURL(this,'avatarImg');" class="form-control" id="changeAvatar"  style="margin-left: 2.5em; width: 82%; display: none">
                <input type="file" name="background" onchange="readURL(this,'backgroundImg' );" class="form-control" id="changeBackground"  style="margin-left: 2.5em; width: 82%; display: none">
            <button type="button" class="btn btn-primary" style="background-color: crimson; border-color: white; margin-left: 40%; " id="buttonForEdit">Save</button>
            </div>
        </form>
    </div>
    <#---------------------------------------------------------------------Добавить плейлист-->
    <div id="addplaylist">
        <form id="postFormAddPlaylist" enctype="multipart/form-data" method="POST">
            <img src="../static/images/closemenu.png" style="width: 35px;height: 35px; float: right; padding: 10px 10px" onclick="showAddPlaylist('none')">
            <div class="playlistImage">
                <label for="enterPlaylistImage"><img id="imgAddPlaylist" src="../static/images/nonalbum.png" alt="card" width="130" height="130" ></label>
                <p style="margin-left: 20px!important;">Enter image</p>
            </div>
            <div class="playlistImage" style="float: right; margin-right: 50px">
                <p class="p7" >Enter name:</p>
                <input type="text" name="title" class="form-control" id="enterPlaylistName" >
            </div>

            <input type="file"  name="file" class="form-control" id="enterPlaylistImage" onchange="readURL(this);">
            <div>Поиск</div>
            <input type="text" id="inputSearchAudio" name="filter" onkeyup="searchSong()">
            <div class="layer">
                <div>Добавить эти песни</div>
                <div id="selectAudioAddPlaylist">

                </div>
                <div id="searchAudioAddPlaylist">

                </div>
            </div>

            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button type="button" class="btn btn-primary" style="background-color: crimson; border-color: white; margin-left: 40%; margin-bottom: 2em;" id="buttonForAddPlaylist">Save</button>
        </form>
    </div>

        <div id="playlist">
            <div class="player1">
                <div class="playlist-inner">
                    <div class="playlist-play">
                        <img class="icon-play2 play-button" id="-1" src="/static/images/playmusic.png" style="width: 60px"></img>
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
    </div>
</main>
<script src="/static/js/library.js"></script>
</@c.page>