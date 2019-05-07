var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

function searchArtist() {
    $.ajax({
        url: '/searchArtist',
        data: ({name:$('#search').val()}),
        success: (data) => {
            $('#list').html("a")
            for(var i = 0; i < data.length; i++){
                $('#list').append("<table style=\"margin-bottom: 3em;\">\n" +
                    "                    <tr>\n" +
                    "                        <td>\n" +
                    "                            <img src=\"/static/images/gettyimages-638549776.jpg\" class=\"prpic\">\n" +
                    "                        </td>\n" +
                    "                        <td>\n" +
                    "                            <p class=\"p3\" style=\"display: inline-block\">California dreaming</p>\n" +
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

        }
    });
}