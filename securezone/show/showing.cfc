<component>
    <cffunction name="show" access="remote" returntype="query">
        <cfscript>
            showDetailsQry = new query();
            showDetailsQry.setDatasource("sample");
            showDetailsQry.setSQL("
            select *
            from suggestion,employee,result,type,department
            where
            suggestion.login_id=employee.login_id
            and
            suggestion.result_id=result.result_id
	        and
	        suggestion.type_id = type.type_id
	        and
	        employee.department_id = department.department_id
            and
            suggestion.suggestion_id = :suggestion_id
            ");

            showDetailsQry.addparam(name="suggestion_id", value="#url.suggestion_id#", cfsqltype="cf_sql_numeric")
        </cfscript>

        <cfreturn showDetailsQry.execute().getresult()>

    </cffunction>
</component>