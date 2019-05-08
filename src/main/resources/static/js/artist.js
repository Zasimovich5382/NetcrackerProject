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
            $('#avatarArtict').attr("src", "/img/"+data.avatar);
            $('#artistName').html(data.name);
            $('#backround').css('backgroundImage', 'url(/img/'+data.background+')')
        }
    });
});

function show(state)
{
    document.getElementById('mainform').style.display = state;
    document.getElementById('gray').style.display = state;
}

function showAddSong(state)
{
    document.getElementById('mainform2').style.display = state;
    document.getElementById('gray').style.display = state;
}

function readURL(input, file ) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#'+file)
                .attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

$("#buttonForAddSong").on('click', function (event) {
    var form = $('#postFormAddSong')[0];
    var data1 = new FormData(form);

    $.ajax({
        url: '/artist/song/add',
        type: "POST",
        dataType: 'json',
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        cache: false,
        data: data1,
        success: (data) => {console.log(data);
            /*$('#avatarArtict').attr("src", "/img/"+data.avatar);
            $('#artistName').html(data.name);
            $('#backround').css('backgroundImage', 'url(/img/'+data.background+')')*/
        }
    });
});