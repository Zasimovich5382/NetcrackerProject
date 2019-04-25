<!DOCTYPE html>
<html lang="en" xmlns:v-bind="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>Emmie James - Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="/static/css/user.css">
</head>
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
    <div class="blocktop" style="background-image: url(../static/images/COM-Lucy-Peach-Homepage.jpg)">
        <p class="p1">Emmie James</p>
    </div>
    <div class="mainblock-back">
        <div class="mainblock">
            <div class="btn-group" role="group" aria-label="Basic example" style="margin-left: 5em; margin-top: 3em;">
                <button type="button" class="btn btn-secondary" style="background-color: #171717; border-color: white">All</button>
                <button type="button" class="btn btn-secondary" style="background-color: #171717; border-color: white">Songs</button>
                <button type="button" class="btn btn-secondary" style="background-color: #171717; border-color: white">Albums</button>
                <button type="button" class="btn btn-secondary" style="background-color: #171717; border-color: white">Playlists</button>
            </div>
            <div class="post">
                <table style="margin-bottom: 3em;">
                    <tr>
                        <td>
                            <img src="/static/images/gettyimages-638549776.jpg" class="prpic">
                        </td>
                        <td>
                            <p class="p3" style="display: inline-block">California dreaming</p>
                            <p class="p4">Single - EP</p>
                            <a href="/templates/explorePage.html"><button type="button" class="btn btn-danger" style="margin-left: 1.2em;">Love</button></a>
                            <a href="/templates/explorePage.html"><button type="button" class="btn btn-danger">Share</button></a>
                        </td>
                        <td>
                            <a href="/templates/search.html"><p class="p5">#indie</p></a>
                        </td>
                        <td>
                            <p class="date">23 days ago.</p>
                        </td>
                    </tr>
                    <hr>
                </table>
                <table style="margin-bottom: 3em;">
                    <tr>
                        <td>
                            <a href="playlist.html" ><img src="/static/images/27393490478_9cca215cfc_o.jpg" class="prpic"></a>
                        </td>
                        <td>
                            <p class="p3" style="display: inline-block">Indie Anthems</p>
                            <p class="p4">Playlist - 2019</p>
                            <a href="/templates/explorePage.html"><button type="button" class="btn btn-danger" style="margin-left: 1.2em;">Love</button></a>
                            <a href="/templates/explorePage.html"><button type="button" class="btn btn-danger">Share</button></a>
                        </td>
                        <td>
                            <a href="/templates/search.html"><p class="p5">#indie</p></a>
                        </td>
                        <td>
                            <p class="date">34 days ago.</p>
                        </td>
                    </tr>
                    <hr>
                </table>
                <table style="margin-bottom: 3em;">
                    <tr>
                        <td>
                            <a href="/templates/album.html" ><img src="/static/images/34-og.jpg" class="prpic"></a>
                        </td>
                        <td>
                            <p class="p3" style="display: inline-block">Indie Life Vibes</p>
                            <p class="p4">Album - 19 songs</p>
                            <a href="/templates/explorePage.html"><button type="button" class="btn btn-danger" style="margin-left: 1.2em;">Love</button></a>
                            <a href="/templates/explorePage.html"><button type="button" class="btn btn-danger">Share</button></a>
                        </td>
                        <td>
                            <a href="/templates/search.html"><p class="p5">#indie</p></a>
                        </td>
                        <td>
                            <p class="date">3 months ago.</p>
                        </td>
                    </tr>
                    <hr>
                </table>
            </div>
        </div>
    </div>
</main>
</body>
</html>