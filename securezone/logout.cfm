<!--- ログインアウト logout.cfm --->
<cfdump var="#form#">
<cflogout>
    <cflocation url="../logintop.cfm?order=logout" addtoken="no">