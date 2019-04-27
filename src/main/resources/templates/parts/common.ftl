<#macro page path>
<!DOCTYPE html>
<html lang="en" xmlns="">
<head>
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>SoundApplication</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <style>
        @import url("https://fonts.googleapis.com/icon?family=Material+Icons");
    </style>
</head>
<#nested>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="/static/js/vue/script.js"></script>
</body>
</html>
</#macro>