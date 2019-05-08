<#import "parts/common.ftl" as c>
<@c.page "/static/css/user.css">
<body style="background-color: #202020">
    <#include "parts/header.ftl">
<main>
    <div class="blocktop" id="backround" style="background-image: url(/img/${artist.background})">
        <img id="avatarArtict" width="300px" height="300px" src="/img/${artist.avatar}" style="border-radius: 50%; position: relative; z-index: 5; top: 50px; left: 100px"/>
        <p class="p1" id="artistName" style="position: relative; left: 400px">${artist.getName()}</p>
    </div>
    <div class="mainblock-back">
        <div class="mainblock">
            <div class="btn-group" role="group" aria-label="Basic example" style="margin-left: 5em; margin-top: 3em;">
                <button type="button" class="btn btn-secondary" style="background-color: #171717; border-color: white">Songs</button>
                <button type="button" class="btn btn-secondary" style="background-color: #171717; border-color: white" onclick="showAddSong('block')">Add</button>
                <button type="button" class="btn btn-secondary" style="background-color: #171717; border-color: white" onclick="show('block')">Edit</button>
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

    <div id="mainform2">
        <form id="postFormAddSong" enctype="multipart/form-data" method="POST">

            <input type="hidden" value="${_csrf.token}" name="_csrf">

            <div class="form-group">
                <p class="p7" style="display: inline-block;">Upload audio:</p>
                <input type="file" name="audio" class="form-control"  style="margin-left: 2.5em; width: 82%">
            </div>
            <div class="form-group">
                <p class="p7" style="display: inline-block;">Upload image for audio:</p>
                <input type="file" name="image" class="form-control"  style="margin-left: 2.5em; width: 82%">
            </div>

            <button id="buttonForAddSong" class="btn btn-primary" style="background-color: crimson; border-color: white; margin-left: 40%; margin-bottom: 2em;">Save</button>
        </form>
    </div>
    <script src="/static/js/artist.js"></script>

    <div id="gray" onclick="show('none');showAddSong('none')"></div>
<#-------------------------------------------------------------форма для редактирования информации о юзере-->
    <div id="mainform">
        <form id="postFormEditInfo" enctype="multipart/form-data" method="POST">

            <div>
                <img src="/static/images/closemenu.png" style="width: 35px;height: 35px; float: right; padding: 10px 10px" onclick="show('none')">
            </div>
            <label for="changeBackground">
                <img src="../static/images/COM-Lucy-Peach-Homepage.jpg" width="100%" height="200px" id="backgroundImg" style="z-index: 5;position: relative;">
            </label>
            <label for="changeAvatar">
                <img src="../static/images/pr_pic.jpg" width="100px" height="100px" id="avatarImg" style="border-radius: 50%; z-index: 10;top: -140px; left: 50px;position: relative;">
            </label>
            <div class="form-group" style="z-index: 10;top: -120px; position: relative;">
                <p class="p7" style="display: inline-block;">Change name:</p>
                <input type="text" name="nickname" value="${artist.getName()}" class="form-control" id="changeName"  style="margin-left: 2.5em; width: 82%">
            </div>
            <div class="form-group" style="z-index: 10;top: -120px; position: relative;">
                <p class="p7" style="display: inline-block;">Change city:</p>
                <input type="text" name="city" <#--value="${artist.getName()}"--> class="form-control" id="changeCity"  style="margin-left: 2.5em; width: 82%">
            </div>


            <input type="file" name="avatar" onchange="readURL(this,'avatarImg');" class="form-control" id="changeAvatar"  style="margin-left: 2.5em; width: 82%; display: none">
            <input type="file" name="background" onchange="readURL(this,'backgroundImg' );" class="form-control" id="changeBackground"  style="margin-left: 2.5em; width: 82%; display: none">



            <input type="hidden" value="${user.id}" name="userId">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button type="button" class="btn btn-primary" style="background-color: crimson; border-color: white; margin-left: 40%; margin-bottom: 2em;" id="buttonForEdit">Save</button>
        </form>
    </div>
    <script src="/static/js/artist.js"></script>
</main>
</@c.page>