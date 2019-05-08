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
                    "                            <p class=\"p3\" style=\"display: inline-block\">"+data.content[i].name+"</p>\n" +
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
                        $('#list').append("<table style=\"margin-bottom: 3em;margin-left: 40px\">\n" +
                            "                    <tr>\n" +
                            "                        <td>\n" +
                            "                            <img src='/img/"+data.content[i].avatar+"'  class=\"prpic\" style=\"border-radius: 50%;width: 150px;height: 150px\">\n" +
                            "                        </td>\n" +
                            "                        <td>\n" +
                            "                            <p class=\"p3\" style=\"display: inline-block\">"+data.content[i].name+"</p>\n" +
                            "                            <p class=\"p4\">Single - EP</p>\n" +
                            "                            <a href=\"/templates/explorePage.html\"><button type=\"button\" class=\"btn btn-danger\" style=\"margin-left: 1.2em;\">Love</button></a>\n" +
                            "                            <a href=\"/templates/explorePage.html\"><button type=\"button\" class=\"btn btn-danger\">Share</button></a>\n" +
                            "                        </td>\n" +
                            "                        <td>\n" +
                            "                            <a href=\"/templates/search.html\"><p class=\"p5\">#indie</p></a>\n" +
                            "                        </td>\n" +
                            "                        <td>\n" +
                            "                            <p class=\"date\">23 days ago.</p>\n" +
                            "                        </td>\n" +
                            "                    </tr>\n" +
                            "                    <hr>\n" +
                            "                </table>")

                    }

                    /* По факту окончания запроса снова меняем значение флага на false */
                    inProgress = false;
                    // Увеличиваем на 10 порядковый номер статьи, с которой надо начинать выборку из базы
                    startFrom += 1;
                }});
        }
    });
}