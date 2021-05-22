
<cfif (form.suggestion_title is "") or (form.suggestion_contents is "")
or (form.type_id is "") or (form.filingdate is "")
or (form.result_id is "") or (form.login_id is "")>
<meta http-equiv="refresh" content="0;url=newImp.cfm?nullNotLogin=yes">
</cfif>

<cfquery datasource="sample">
    insert into suggestion
    (
        suggestion_title,
        type_id,
        suggestion_contents,
        filingdate,
        result_id,
        login_id
    )
    values(
        '#suggestion_title#',
        #type_id#,
        '#suggestion_contents#',
        '#filingdate#',
        #result_id#,
        #login_id#
    )
</cfquery>
<cflocation  url="./top.cfm">