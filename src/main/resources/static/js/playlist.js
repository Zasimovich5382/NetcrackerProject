var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

/*
$(document).ready(loadData);
function loadData() {
    $.ajax({
        url: '/playlistRest/2',
        type: "GET",
        success: (data) => {
            console.log(data);
        }
    });
}*/
