<#import "parts/common.ftl" as c>
<@c.page "/static/css/search.css">
<link rel="stylesheet" href="/static/css/player.css">
<body>
 <#include "parts/header.ftl">
<main style="background-image: url(/static/images/background.jpg)">
    <div class="blocktop" style="background-image: url(/static/images/pex.jpg)">
        <p class="p1">Search.</p>
    </div>
    <div class="mainblock-back">
        <div class="mainblock">
            <p class="p3">Search by categories:</p>
            <div class="btn-group" role="group" aria-label="Basic example" style="margin-left: 6.2em;">
                <button type="button" id="searchArtistButton" class="btn btn-secondary" onclick="changeSearch('artists')" style="background-color: tomato; border-color: white">Artists</button>
                <#--<button type="button" class="btn btn-secondary" style="background-color: #171717; border-color: white">Albums</button>
                <button type="button" class="btn btn-secondary" style="background-color: #171717; border-color: white">Playlists</button>-->
                <button type="button" id="searchSongButton" class="btn btn-secondary" onclick="changeSearch('songs')" style="background-color: #171717; border-color: white">Songs</button>
                <#--<button type="button" class="btn btn-secondary" style="background-color: #171717; border-color: white">Genres</button>-->
            </div>
            <div class="input-group mb-3" style="padding-top: 2em; padding-right: 6em;">
                <input id="search" type="text" onkeyup="searchArtist()" class="form-control" placeholder="Search by categories..." aria-label="Recipient's username" aria-describedby="button-addon2" style="margin-left: 6.2em;  margin-bottom: 2em;">

            </div>

            <div id="list" style="padding-bottom: 5em;">
                <#--<p class="p2">Thousands local artists are waiting for you.</p>
                <p class="p4">Join now.</p>-->
            </div>

</main>
<script src="/static/js/playlist.js"></script>
<script src="/static/js/search.js"></script>
</@c.page>