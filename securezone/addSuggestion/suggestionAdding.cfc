<cfcomponent>
    <cffunction  name="suggestionAdd" access="remote">

        <cfscript>
            if( (form.suggestion_title is "") or (form.suggestion_contents is "")
            or (form.type_id is "") or (form.filingdate is "")
            or (form.result_id is "") or (form.login_id is "")) {
                writeOutput('<meta http-equiv="refresh" content="0;url=suggestionAdd.cfm?nullNotLogin=yes">');
            } else {
            suggestionAddQry = new query();
            suggestionAddQry.setdatasource("sample");
            suggestionAddQry.setSQL("
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
                :suggestion_title,
                :type_id,
                :suggestion_contents,
                :filingdate,
                :result_id,
                :login_id
            )");

            suggestionAddQry.addparam(name="suggestion_title", value="#form.suggestion_title#", cfsqltype="cf_sql_varchar");
            suggestionAddQry.addparam(name="type_id", value="#form.type_id#", cfsqltype="cf_sql_numeric");
            suggestionAddQry.addparam(name="suggestion_contents", value="#form.suggestion_contents#", cfsqltype="cf_sql_varchar");
            suggestionAddQry.addparam(name="filingdate", value="#form.filingdate#", cfsqltype="CF_SQL_DATE");
            suggestionAddQry.addparam(name="result_id", value="1", cfsqltype="cf_sql_numeric");
            suggestionAddQry.addparam(name="login_id", value="#form.login_id#", cfsqltype="cf_sql_numeric");
            suggestionAddQry.execute();

            location("suggestionAddPop.cfm", "false", "301");


            }
        </cfscript>
    </cffunction>
</cfcomponent>