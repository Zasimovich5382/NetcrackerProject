var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

function searchArtist() {
    $.ajax({
        url: '/searchArtist',
        data: ({name:$('#search').val(), p:'0'}),
        success: (data) => {console.log(data)
            $('#list').html("")
            for(var i = 0; i < data.content.length; i++){
                $('#list').append("<table style=\"margin-bottom: 3em;margin-left: 40px\">\n" +
                    "                    <tr>\n" +
                    "                        <td>\n" +
                    "                          <a href='/artist/"+data.content[i].id+"'> <img src='/img/"+data.content[i].avatar+"'  class=\"prpic\" style=\"border-radius: 50%;width: 150px;height: 150px\"></a>\n" +
                    "                        </td>\n" +
                    "                        <td>\n" +
                    "                            <p class=\"p3\" style=\"display: inline-block\">"+data.content[i].nickname+"</p>\n" +
                    "                            <p class=\"p4\">Single - EP</p>\n" +
                    "                            <a href=\"/templates/explorePage.html\"><button type=\"button\" class=\"btn btn-danger\" style=\"margin-left: 1.2em;\">Love</button></a>\n" +
                    "                            <a href=\"/templates/explorePage.html\"><button type=\"button\" class=\"btn btn-danger\">Share</button></a>\n" +
                    "                        </td>\n" +
                    "                        <td>\n" +
                    "                            <a href=\"/templates/search.html\"><p class=\"p5\"></p></a>\n" +
                    "                        </td>\n" +
                    "                        <td>\n" +
                    "                            <p class=\"date\">"+data.content[i].city+"</p>\n" +
                    "                        </td>\n" +
                    "                    </tr>\n" +
                    "                    <hr>\n" +
                    "                </table>")

            }
            scroll()

        }
    });


}


function scroll(){

    /* Переменная-флаг для отслеживания того, происходит ли в данный момент ajax-запрос.*/
    var inProgress = false;

    var startFrom = 1;

    $(window).scroll(function() {

        /* Если высота окна + высота прокрутки больше или равны высоте всего документа и ajax-запрос в настоящий момент не выполняется, то запускаем ajax-запрос */
        if($(window).scrollTop() + $(window).height() >= $(document).height() - 200 && !inProgress) {

            $.ajax({
                url: '/searchArtist',
                data: ({name:$('#search').val(), p:startFrom}),
                beforeSend: function() {

                    inProgress = true;}

            }).done(function(data){


                if (data.content.length > 0) {

                    for(var i = 0; i < data.content.length; i++){
                        $('#list').append("<div id='remove'></div> <table style=\"margin-bottom: 3em;margin-left: 40px\">\n" +
                            "                    <tr>\n" +
                            "                        <td>\n" +
                            "                            <img src='/img/"+data.content[i].avatar+"'  class=\"prpic\" style=\"border-radius: 50%;width: 150px;height: 150px\">\n" +
                            "                        </td>\n" +
                            "                        <td>\n" +
                            "                            <p class=\"p3\" style=\"display: inline-block\">"+data.content[i].nickname+"</p>\n" +
                            "                            <p class=\"p4\">Single - EP</p>\n" +
                            "                            <a href=\"/templates/explorePage.html\"><button type=\"button\" class=\"btn btn-danger\" style=\"margin-left: 1.2em;\">Love</button></a>\n" +
                            "                            <a href=\"/templates/explorePage.html\"><button type=\"button\" class=\"btn btn-danger\">Share</button></a>\n" +
                            "                        </td>\n" +
                            "                        <td>\n" +
                            "                            <a href=\"/templates/search.html\"><p class=\"p5\"></p></a>\n" +
                            "                        </td>\n" +
                            "                        <td>\n" +
                            "                            <p class=\"date\">"+data.content[i].city+"</p>\n" +
                            "                        </td>\n" +
                            "                    </tr>\n" +
                            "                    <hr>\n" +
                            "                </table><div>")

                    }

                    /* По факту окончания запроса снова меняем значение флага на false */
                    inProgress = false;
                    // Увеличиваем на 10 порядковый номер статьи, с которой надо начинать выборку из базы
                    startFrom += 1;
                }});
        }
    });
}


function searchSongs() {
    $.ajax({
        url: '/searchSongs/artist',
        data: ({name:$('#search').val(), p:'0'}),
        success: (data) => {console.log(data)
            $('#list').html("<div id='remove'></div>")
            for(var i = 0; i < data.content.length; i++){
                $('#remove').append("<div id='"+data.content[i].id+"' data-duration='"+data.content[i].metaDuration+"' data-path='"+data.content[i].url+"' data-artist='"+data.content[i].artist+"' data-title='"+data.content[i].title+"' class=\"playlist-item\">\n" +
                    "                            <div class=\"playlist-inner\">\n" +
                    "                                    <div class=\"playlist-play\">\n" +
                    "                                                    <img class=\"icon-play2 play-button2\" src=\"/static/images/playmusic.png\" style=\"width: 30px\"></img>\n" +
                    "                                                    <div class=\"playlist-duration\"> </div>\n" +
                    "                                               </div>\n" +
                    "                                            <div class=\"playlist-title\">"+data.content[i].artist+data.content[i].title+" </div>\n" +
                    "                                        </div>\n" +
                    "                                <div class=\"playlist-meta\"><img src='/img/"+data.content[i].coverUrl+"' width='60' height='60'>\n" +
                    "                                </div>\n" +
                    "                        </div>")}
            scrollArtist()

        }
    });


}

function changeSearch(search) {
    if(search === "songs"){
        $('#searchSongButton').css('background-color', 'tomato');
        $('#searchArtistButton').css('background-color', '#171717');
        $('#remove').remove();
        $('#search').attr("onkeyup", "searchSongs()");
    }
    if(search === "artists"){
        $('#searchSongButton').css('background-color', '#171717');
        $('#searchArtistButton').css('background-color', 'tomato');
        $('#remove').remove();
        $('#search').attr("onkeyup", "searchArtist()");
    }

}


function scrollArtist(){

    /* Переменная-флаг для отслеживания того, происходит ли в данный момент ajax-запрос.*/
    var inProgress = false;

    var startFrom = 1;

    $(window).scroll(function() {

        /* Если высота окна + высота прокрутки больше или равны высоте всего документа и ajax-запрос в настоящий момент не выполняется, то запускаем ajax-запрос */
        if($(window).scrollTop() + $(window).height() >= $(document).height() - 200 && !inProgress) {

            $.ajax({
                url: '/searchSongs/artist',
                data: ({name:$('#search').val(), p:startFrom}),
                beforeSend: function() {

                    inProgress = true;}

            }).done(function(data){


                if (data.content.length > 0) {

                    for(var i = 0; i < data.content.length; i++){
                        $('#remove').append("<div id='"+data.content[i].id+"' data-duration='"+data.content[i].metaDuration+"' data-path='"+data.content[i].url+"' data-artist='"+data.content[i].artist+"' data-title='"+data.content[i].title+"' class=\"playlist-item\">\n" +
                            "                            <div class=\"playlist-inner\">\n" +
                            "                                    <div class=\"playlist-play\">\n" +
                            "                                                    <img class=\"icon-play2 play-button2\" src=\"/static/images/playmusic.png\" style=\"width: 30px\"></img>\n" +
                            "                                                    <div class=\"playlist-duration\"> </div>\n" +
                            "                                               </div>\n" +
                            "                                            <div class=\"playlist-title\">"+data.content[i].artist+data.content[i].title+" </div>\n" +
                            "                                        </div>\n" +
                            "                                <div class=\"playlist-meta\"><img src='/img/"+data.content[i].coverUrl+"' width='60' height='60'>\n" +
                            "                                </div>\n" +
                            "                        </div>")

                    }

                    /* По факту окончания запроса снова меняем значение флага на false */
                    inProgress = false;
                    // Увеличиваем на 10 порядковый номер статьи, с которой надо начинать выборку из базы
                    startFrom += 1;
                }});
        }
    });
}