var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

$("#logout").on('click', function (event) {
    $.ajax({
        url: '/logout',
        type: "POST"
    });
    location.reload(true);
});
