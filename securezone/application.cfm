
<cfapplication name="secure" clientmanagement="yes" sessionmanagement="Yes">
<!---clientmanagementsessionクライアント変数を有効にする--->
<!---sessionmanagementセッション変数を有効にする--->

<cfif not IsDefined("session.login_id") OR not IsDefined("cookie.cemployee_name")>
    <cflocation url="../logintop.cfm?=badLogin=yes">
</cfif>


