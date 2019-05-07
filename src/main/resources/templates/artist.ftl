<#import "parts/common.ftl" as c>
<@c.page "/static/css/user.css">
<body style="background-color: #202020">
    <#include "parts/header.ftl">
<main>
    <div class="blocktop" style="background-image: url(../static/images/COM-Lucy-Peach-Homepage.jpg)">
            <span <#--id="avatar"-->></span>
        <p class="p1">${artist.getName()}</p>
    </div>
    <div class="mainblock-back">
        <div class="mainblock">
            <div class="btn-group" role="group" aria-label="Basic example" style="margin-left: 5em; margin-top: 3em;">
                <button type="button" class="btn btn-secondary" style="background-color: #171717; border-color: white">Songs</button>
                <button type="button" class="btn btn-secondary" style="background-color: #171717; border-color: white">Albums</button>
                <button type="button" class="btn btn-secondary" style="background-color: #171717; border-color: white" onclick="show('block')">Add</button>
            </div>
            <div class="post" <#--id="artistMusic"-->>
               <#list artist.getSongs() as song>
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
                </table>
               </#list>
            </div>
        </div>
    </div>
    <div class="mainform">
        <form id="postFormAddSong" enctype="multipart/form-data" method="POST">
            <p class="p2">Name:</p>
            <div class="form-group">
                <input type="file" name="audio" class="form-control"  style="margin-left: 2.5em; width: 82%">
            </div>
            <div class="form-group">
                <input type="file" name="img" class="form-control"  style="margin-left: 2.5em; width: 82%">
            </div>
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button id="buttonForAddSong" class="btn btn-primary" style="background-color: crimson; border-color: white; margin-left: 40%; margin-bottom: 2em;">Save</button>
        </form>
    </div>
    <script src="/static/js/artist.js"></script>

    <div id="gray" onclick="show('none');showAddPlaylist('none')"></div>
<#-------------------------------------------------------------форма для редактирования информации о юзере-->
    <div id="mainform">
        <form id="postFormEditInfo" enctype="multipart/form-data" method="POST">
            <div>
                <p class="p7" style="display: inline-block;">Change name:</p>
                <img src="/static/images/closemenu.png" style="width: 35px;height: 35px; float: right; padding: 10px 10px" onclick="show('none')">
            </div>
            <div class="form-group">
                <input type="text" name="nickname" value="${user.nickname}" class="form-control" id="changeName"  style="margin-left: 2.5em; width: 82%">
            </div>

            <div>
                <p class="p7" style="display: inline-block;">Change avatar:</p>
            </div>
            <div class="form-group">
                <input type="file" name="avatar" class="form-control" id="changeName"  style="margin-left: 2.5em; width: 82%">
            </div>


            <input type="hidden" value="${user.id}" name="userId">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button type="button" class="btn btn-primary" style="background-color: crimson; border-color: white; margin-left: 40%; margin-bottom: 2em;" id="buttonForEdit">Save</button>
        </form>
    </div>
    <script src="/static/js/artist.js"></script>
</main>
</@c.page>