<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    nickname = user.getNickname()
    id = user.getId()
    isArtist = user.isArtist()
    isUser = true
    >
<#else>
    <#assign
    name = "unknown"
    isUser = false
    isArtist = false
    >
</#if>