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
            <table style="margin-bottom: 3em; padding-left: auto">
                <tr>
                    <td>
                        <div class="card" style="width: 18rem; margin-left: 4em; margin-top: 1em; margin-bottom: 2em">
                            <a href="/templates/userLibrarySongs.html"><img src="/static/images/r-b-breakfast-club.jpg" class="card-img-top" alt="card" width="200" height="200"></a>
                            <div class="card-body">
                                <h5 class="card-title">Songs</h5>
                                <p class="card-text">Listen all your favorite songs. Shuffled?</p>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="card" style="width: 18rem;  margin-top: 1em; margin-bottom: 2em; margin-left: 4em;">
                            <a href="/templates/userLibraryPlaylists.html"><img src="/static/images/gettyimages-638549776.jpg" class="card-img-top" alt="card" width="200" height="200"></a>
                            <div class="card-body">
                                <h5 class="card-title">Playlists</h5>
                                <p class="card-text">Going back to playlists you've liked.</p>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="card" style="width: 18rem;  margin-top: 1em; margin-bottom: 2em; margin-left: 4em;">
                            <a href="/templates/userLibraryAlbums.html"><img src="/static/images/on-rock-music-and-writing-cover.jpg" class="card-img-top" alt="card" width="200" height="200"></a>
                            <div class="card-body">
                                <h5 class="card-title">Albums</h5>
                                <p class="card-text">Favorite albums by favorite artists.</p>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</main>
</body>
</@c.page>