<cfcomponent>
    <cffunction name="updateItem" access="remote" returntype="query">
        <cfargument  name="suggestion_id" type="numeric" required="true">

        <cfscript>
            updateItemQry = new query();
            updateItemQry.setDatasource("sample");
            updateItemQry.setSQL("
            select *
            from suggestion
            WHERE suggestion_id = :suggestion_id
            ");
            updateItemQry.addparam(name="suggestion_id", value="#arguments.suggestion_id#", cfsqltype="cf_sql_numeric");
        </cfscript>
        
        <cfreturn updateItemQry.execute().getresult()>
        
    </cffunction>
    


<cffunction name="updating" access="remote">
    
    <cfscript>

        if( (form.suggestion_title is "") or (form.suggestion_contents is "")
        or (form.type_id is "") or (form.filingdate is "")
        or (form.login_id is "")) {

            writeOutput('<meta http-equiv="refresh" content="0;url=update.cfm?nullNotLogin=yes">');

        } else {

        suggestionAddQry = new query();
        suggestionAddQry.setDatasource("sample");
        suggestionAddQry.setSQL("
        update suggestion
        set
        suggestion_title = :suggestion_title,
        type_id = :type_id,
        suggestion_contents = :suggestion_contents,
        filingdate = :filingdate,
        login_id = :login_id
        WHERE
        suggestion_id = :suggestion_id
        ");

        suggestionAddQry.addparam(name="suggestion_title", value="#form.suggestion_title#", cfsqltype="cf_sql_varchar");
        suggestionAddQry.addparam(name="type_id", value="#form.type_id#", cfsqltype="cf_sql_numeric");
        suggestionAddQry.addparam(name="suggestion_contents", value="#form.suggestion_contents#", cfsqltype="cf_sql_varchar");
        suggestionAddQry.addparam(name="filingdate", value="#form.filingdate#", cfsqltype="CF_SQL_DATE");
        suggestionAddQry.addparam(name="login_id", value="#form.login_id#", cfsqltype="cf_sql_numeric");
        suggestionAddQry.addparam(name="suggestion_id", value="#form.suggestion_id#", cfsqltype="cf_sql_numeric");

        suggestionAddQry.execute();

        location("updationgPop.cfm", "false", "301");

        }

    </cfscript>
  

</cffunction>

</cfcomponent>



