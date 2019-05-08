var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

$(document).ready(
    readyPlaylist());

function readyPlaylist() {
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
        $('.play-button2').attr("src","../static/images/playmusic.png");
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
    });

}