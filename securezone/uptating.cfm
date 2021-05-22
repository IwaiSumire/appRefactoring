<cfquery datasource="sample">
update suggestion
    set suggestion_title='#suggestion_title#',
        type_id=#type_id#,
        suggestion_contents='#suggestion_contents#',
        filingdate='#filingdate#',
        login_id=#login_id#
WHERE suggestion_id = #suggestion_id#
</cfquery>

<cflocation  url="./top.cfm">