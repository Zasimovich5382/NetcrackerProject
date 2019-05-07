var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

$("#buttonForEdit").on('click', function (event) {
    var form = $('#postFormEditInfo')[0];
    var data1 = new FormData(form);

    $.ajax({
        url: '/editArtist',
        type: "POST",
        dataType: 'json',
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        cache: false,
        data: data1,
        success: (data) => {console.log(data);
        }
    });
});

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