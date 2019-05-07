var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});
/*var id = document.getElementById('mainArtist');*/
var audioApi = new Vue.resource('/artistInfo/'/*+id.getAttribute('data-id')*/);
Vue.component('audio-exem',{
    props: ['audio'],
    template:'<table style="margin-bottom: 3em;">\n' +
        '                    <tr>\n' +
        '                        <td>\n' +
        '                            <img src="/static/images/gettyimages-638549776.jpg" class="prpic">\n' +
        '                        </td>\n' +
        '                        <td>\n' +
        '                            <p class="p3" style="display: inline-block">{{audio.name}}</p>\n' +
        '                            <p class="p4">Single - EP</p>\n' +
        '                            <a href="/templates/explorePage.html"><button type="button" class="btn btn-danger" style="margin-left: 1.2em;">Love</button></a>\n' +
        '                            <a href="/templates/explorePage.html"><button type="button" class="btn btn-danger">Share</button></a>\n' +
        '                        </td>\n' +
        '                        <td>\n' +
        '                            <a href="/templates/search.html"><p class="p5">#indie</p></a>\n' +
        '                        </td>\n' +
        '                        <td>\n' +
        '                            <p class="date">23 days ago.</p>\n' +
        '                        </td>\n' +
        '                    </tr>\n' +
        '                    <hr>\n' +
        '                </table>'
});
Vue.component('audio-list',{
    props: ['audios'],
    template:'<div><audio-exem v-for="audio in audios" :audio = "audio" :key = "audio.list"></audio-exem></div>',
    created: function () {
        audioApi.get().then(result =>
        result.json().then(data => console.log(data)
        /*data.forEach(audio => this.audios.push(audio))*/))
    }
});

var app = new Vue({
    el: '#artistMusic',
    template:'<audio-list :audios = "audios"/>',
    data: {
        audios: []
    }
});



