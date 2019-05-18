<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
    <#--userS = Session.SPRING_SECURITY_CONTEXT.authentication.principal-->
    isUser = true
    >
<#else>
    <#assign
    isUser = false
    >
</#if>