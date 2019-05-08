var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

//Функция показа
function show(state)
{
    document.getElementById('mainform').style.display = state;
    document.getElementById('gray').style.display = state;
}

function showAddPlaylist(state)
{
    document.getElementById('addplaylist').style.display = state;
    document.getElementById('gray').style.display = state;
}
$("#buttonForEdit").on('click', function (event) {
    $.ajax({
        url: '/editUser',
        type: "POST",
        dataType: 'json',
        data: ({
            email: $("#changeEmail").val(),
            nickname: $("#changeName").val(),
            password:$("#changePassword").val(),
            artist:$("#checboxEditArtist").is(':checked')
        }),
        success: function (html) {
            $('#changeName').html(html);
            $('#nicknamelibrary').html($('#changeName').val());
            $('#changeEmail').html(html);
            $('#changePassword').html(html);
        }
    });
});

$("#buttonForAddPlaylist").on('click', function (event) {
    var form = $('#postFormAddPlaylist')[0];
    var data1 = new FormData(form);
    var array = [];
    var element =document.getElementById('selectAudioAddPlaylist').children;
    for(var i=0; i < element.length; i++){
        array.push(element[i].getAttribute('id'));
    }

    $.ajax({
        url: '/addPlaylist',
        type: "POST",
        dataType: 'json',
        enctype: 'multipart/form-data',
        processData: false,  // Important!
        contentType: false,
        cache: false,
        data: data1,
        success: (data) => {addSong(data.id, array);
        }
    });
});
function addSong(id, array) {
    $.ajax({
        url: '/addPlaylistSong',
        type: "POST",
        contentType: 'application/json',
        data: JSON.stringify({
            array: array,
            id: id
        }),
        success: (data) => {console.log(data)}
    });
}

function searchSong() {
    $.ajax({
        url: '/searchSongAddPlaylist',
        data: ({title:$('#inputSearchAudio').val()}),
        success: (data) => {
            $('#searchAudioAddPlaylist').html("<div> Результат</div>");
           for(var i = 0; i < data.length; i++){
               $('#searchAudioAddPlaylist').append('' +
                   '<div id="'+data[i].id+'" data-duration="'+data[i].metaDuration+'" data-path="/sound/'+data[i].song_name+'" data-artist="'+data[i].metaArtist+'" data-title="'+data[i].metaTitle+'" class="playlist-item" onclick="play1('+data[i].id+')">\n' +
                   '    <div class="playlist-inner">\n' +
                   '        <div class="playlist-play">\n' +
                   '                    <img class="icon-play2 play-button2" src="/static/images/playmusic.png" style="width: 30px"></img>\n' +
                   '                </div>\n' +
                   '                <div class="playlist-title">'+data[i].metaArtist+' - '+data[i].metaTitle+' </div>\n' +
                   '            </div>\n' +
                   '        <div class="playlist-meta">'+parseInt(data[i].metaDuration/60)+':'+parseInt(data[i].metaDuration%60)+'\n' +
                   '    </div>\n' +
                   '<button type="button" id="button'+data[i].id+'"  onclick="addSongToPlaylist('+data[i].id+')" style="background-color: crimson;float: right; border-color: #171717;">Add</button>'+
                   '</div>');
           }

        }
    });
}
function addSongToPlaylist(state) {
    var audio = document.getElementById(state);
    var parent = document.getElementById('selectAudioAddPlaylist');
    $('#selectAudioAddPlaylist').append(audio);
    $('#button'+state).html('delete');
    $('#button'+state).attr('onclick', 'delMusic('+state+')')

}

function delMusic(state){
    document.getElementById(state).remove();
}
//////////////////////////////playlist
/*$(document).ready( readyPlaylist());*/
function play1(id){
    $('.play-button2').attr("src","/static/images/playmusic.png");
    playPauseSong(id);
    id++;
    $('.sledbtn#sled').attr('data-id', id);
    id--;id--;
    $('.sledbtn#pred').attr('data-id', id);
};

    var idSong, song, i, volume = 1, mute = false;

    function playNewSong(id) {
        songForId = document.getElementById(id);
        var curtime, cur = -100;
        idSong = id;
        song = new Audio(songForId.getAttribute('data-path'));
        $('.play-button').attr("src","/static/images/stop.png");
        $('.playlist-item#'+id+' .play-button2').attr("src","/static/images/stop.png");
        $('.player1 .playlist-title').text(songForId.getAttribute('data-artist'));
        $('.play-button').attr('id', id);
        song.play();
        song.volume = volume;
        song.addEventListener('timeupdate', function(){
            curtime = song.currentTime;
            cur = -((document.getElementById(idSong).getAttribute('data-duration') - curtime)*100)/document.getElementById(idSong).getAttribute('data-duration');
            $('.playlist-meta').text(parseInt(curtime/60)+':'+parseInt(curtime%60));
            $('.progress').css({'left':cur+'%'});
        });
    }
    function playPauseSong(id) {
        if (song) {
            if ( id === idSong ) {
                if (song.paused) {
                    song.play();
                    song.volume = volume;
                    $('.play-button').attr("src","../static/images/stop.png");
                    $('.playlist-item#'+id+' .play-button2').attr("src","../static/images/stop.png");
                }
                else {
                    song.pause();
                    $('.play-button').attr("src","../static/images/playmusic.png");
                    $('.playlist-item#'+id+' .play-button2').attr("src","../static/images/playmusic.png");
                }
            }
            else {
                song.pause();
                $('.play-button2').attr("src","../static/images/playmusic.png");
                $('.playlist-item#'+id+' .play-button2').attr("src","../static/images/stop.png");
                playNewSong(id);
            }
        }
        else {
            playNewSong(id);
        }
    }

    $('.playlist-item, .play-button').on('click', function(){
        var id = $(this).attr('id');
        $('.play-button2').attr("src","/static/images/playmusic.png");
        playPauseSong(id);
        id++;
        $('.sledbtn#sled').attr('data-id', id);
        id--;id--;
        $('.sledbtn#pred').attr('data-id', id);
    });

    //вперед-назад
    $('.sledbtn').on('click', function(){
        var
            id = $(this).attr('data-id');
        if (id !== -1){
            $('.play-pause_song').css({'background-position':'4px 4px'});
            playPauseSong(id);
            id++;
            $('.sledbtn#sled').attr('data-id', id);
            id--;id--;
            $('.sledbtn#pred').attr('data-id', id);
        }
    });
    //выключить звук
    $('.mute').on('click', function(){
        if (song){
            if (mute === false){
                mute = true;
                $('.mute').css({'color':'#C0392B'});
                $('.volume').val(0);
            }
            else {
                mute = false;
                $('.mute').css({'color':'#ECF0F1'});
                $('.volume').val(100);
            }
            song.muted = mute;
        }
    });
    //громкость
    $('.volume').on('change', function(){
        var
            val = $(this).val();
        if (song){
            volume = val/100;
            song.volume = volume;
            if (val === 0){
                mute = true;
                $('.mute').css({'color':'#C0392B'});
            }
            else if (val > 0){
                mute = false;
                $('.mute').css({'color':'#ECF0F1'});
            }
        }
    });

    $('.range').on('mouseenter', function(){
        if (song) {
            var
                id = $('.play-button').attr('id'),
                offset = $(this).offset(),
                dur = songForId.getAttribute('data-duration'),
                w = $(this).width();
            $('.setTime').show();
            $('.range').on('mousemove', function(e){
                var
                    x = e.PageX - offset.left,
                    xproc = (x*100)/w,
                    sec = (xproc*dur)/100;
                $('.setTime').css({'left':x-10});
                $('.setTime').text(parseInt(sec/60)+':'+parseInt(sec%60));
                $('.range').on('click', function(){
                    xproc = xproc-100;
                    $('.progress').css({'left':xproc+'%'});
                    Song.currentTime = sec;
                });
            });
        }
    });

    $('.range').on('mouseout', function(){
        $('.setTime').hide();
    })

/////////////////////////////////отображения файла без загрузки на сервер
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#imgAddPlaylist')
                .attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}