var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

$(document).ready(loadValues(),
    $('#sumbitButton').on("click", saveValues() ));

function saveValues()
{
    if($('#checkBox').is(":checked")){
        localStorage._user = document.getElementById("inputName").value;
        localStorage._passvord = document.getElementById("inputPassword").value;
    }
}
function loadValues()
{
    if(localStorage._user) {
        document.getElementById("inputName").value = localStorage._user;
        document.getElementById("inputPassword").value = localStorage._passvord;
    }
}