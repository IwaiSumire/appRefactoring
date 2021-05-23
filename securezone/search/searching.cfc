<cfcomponent>
    <cffunction name="search" access="remote" returntype="query">
        <cfscript>
            searchResQry = new query();
            searchResQry.setDatasource("sample");
            searchResQry.setSQL("
            SELECT
            *
            FROM
            suggestion
            join
            employee
            on
            suggestion.login_id = employee.login_id
            join
            result
            on
            suggestion.result_id = result.result_id
            where
            suggestion.suggestion_title LIKE :search
            or
            employee.employee_name LIKE :search
            or
            employee.email LIKE :search
            order by suggestion.filingdate desc, suggestion.suggestion_id desc
            ");
            searchResQry.addparam(name="search", value="%#form.search#%", cfsqltype="cf_sql_varchar");
        </cfscript>
        <cfreturn searchResQry.execute().getResult()>
    </cffunction>
</cfcomponent>