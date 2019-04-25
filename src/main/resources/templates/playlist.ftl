<#import "parts/common.ftl" as c>
<@c.page "/static/css/playlist.css">
<body style="background-color: #202020">
<header>
    <nav class="navbar navbar-expand-lg navbar-light dark" style="background: #171717">
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                    <a class="nav-link" href="/templates/mainPage.html" style="color: white;">Home<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/templates/explorePage.html" style="color: white;">Explore</a>
                </li>
            </ul>
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0" style="display: inline; margin-right: auto">
                <a class="navbar-brand" href="/templates/mainPage.html" style="margin: auto"><img src="/static/images/play.png" width="33" height="34"></a>
            </ul>
            <a class="nav-link" href="/templates/search.html" style="color: white;">Search</a>
            <a class="nav-link" href="/templates/registration.html" style="color: white;">Sign Up</a>
        </div>
    </nav>
</header>
<main>
    <div class="blocktop">
        <table>
            <tr>
                <td class="playlistImage" style="width: 40%"></td>
                <td class="playlistInfoBack" style="width: 60%">
                    <p class="p1">Indie Anthems: <cite class="cite">Indie</cite></p>
                    <p class="p2">Calm summer hits are ready for the end of the winter. Aren't you?</p>
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
                <li class="list-group-item">1. Song Name - Artist<nobr class="nobr">Album Name</nobr><nobr class="nobr">03:56</nobr></li>
                <li class="list-group-item">2. Song Name - Artist<nobr class="nobr">Album Name</nobr><nobr class="nobr">03:56</nobr></li>
                <a href="/templates/song.html"><li class="list-group-item active" style="background-color: crimson; border-color: white">3. Song Name - Artist<nobr class="nobr">Album Name</nobr><nobr class="nobr">03:56</nobr></li></a>
                <li class="list-group-item">4. Song Name - Artist<nobr class="nobr">Album Name</nobr><nobr class="nobr">03:56</nobr></li>
                <li class="list-group-item">5. Song Name - Artist<nobr class="nobr">Album Name</nobr><nobr class="nobr">03:56</nobr></li>
                <li class="list-group-item">6. Song Name - Artist<nobr class="nobr">Album Name</nobr><nobr class="nobr">03:56</nobr></li>
                <li class="list-group-item">7. Song Name - Artist<nobr class="nobr">Album Name</nobr><nobr class="nobr">03:56</nobr></li>
                <li class="list-group-item">8. Song Name - Artist<nobr class="nobr">Album Name</nobr><nobr class="nobr">03:56</nobr></li>
                <li class="list-group-item">9. Song Name - Artist<nobr class="nobr">Album Name</nobr><nobr class="nobr">03:56</nobr></li>
            </ul>
        </div>
    </div>
</main>
</@c.page>