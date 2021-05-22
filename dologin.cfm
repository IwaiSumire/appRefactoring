
<cfif (form.login_id is "") or (form.login_pass is "")>
    <meta http-equiv="refresh" content="0;url=logintop.cfm?nullNotLogin=yes">
</cfif>
<cfset login_pass = #hash(form.login_pass,'SHA-256')#>
<cfquery datasource="sample" name="dologin">
select *
from employee
where '#form.login_id#' = login_id
and '#login_pass#' = login_pass
</cfquery>

<cfif dologin.employee_id is not ""><!---もし、idとpassが一致するものが見つからなければ--->


    <cflock scope="session" timeout="10" type="EXCLUSIVE">
        <!---セッション変数にsecureidをセット---><!---EXCLUSIVE：排他的ロック--->
        <cfset session.login_id = dologin.login_id>
        <!---セッションidはログインしようとしたsecureid--->
    </cflock>

    <cfcookie name="clogin_id" value="#dologin.login_id#"><!---ログインidをcookieに保存--->
    <cfcookie name="cemployee_name" value="#dologin.employee_name#"><!---ログインidをcookieに保存--->
    <cfcookie name="c_authority_id" value="#dologin.authority_id#"><!---ログインidをcookieに保存--->

    <meta http-equiv="refresh" content="0;url=securezone/top.cfm"><!---ログインする→toppageに行く--->

</cfif>


<cfif dologin.recordcount EQ 0><!---EQは＝と一緒ね--->
    <meta http-equiv="refresh" content="0;url=logintop.cfm?badLogin=yes">
</cfif>
