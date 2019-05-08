/*
$(".btt").on("click", function () {
    $.ajax({
        url: 'aadSongToPlaylist',
        type: "POST",
        data: ({
            song: $('#btt').data()
        }),
        success: (data) => {
            console.log(data);
        }
    });
});
*/

function loadData() {
    $.ajax({
        url: '/songsRest',
        type: "GET",
        success: (data) => {
            console.log(data);
        }
    });
}
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {

    xhr.setRequestHeader(header, token);
});
$(document).ready(loadData);

$(".btt").on('click', function (event) {
    $.ajax({
        url: '/songsRest',
        type: "POST",
        dataType: 'json',
        data: ({
            song: $(event.target).attr('data-songid'),
            playlist: $(event.target).attr('data-playlistid'),
        }),
        success: (data) => {
            console.log(data);
        }
    });
});

    var el = document.getElementsByClassName('addToPlaylist');
    for(var i=0; i<el.length; i++) {
        el[i].addEventListener("mouseenter", showSub, false);
        el[i].addEventListener("mouseleave", hideSub, false);
    }
    function showSub(e) {
        if(this.children.length>1) {
            this.children[1].style.height = "auto";
            this.children[1].style.overflow = "visible";
            this.children[1].style.opacity = "1";
            this.children[1].style.animation;
        } else {
            return false;
        }
    }
    function hideSub(e) {
        if(this.children.length>1) {
            this.children[1].style.height = "0px";
            this.children[1].style.overflow = "hidden";
            this.children[1].style.opacity = "0";
        } else {
            return false;
        }

}