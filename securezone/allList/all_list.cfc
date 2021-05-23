<component>
    <cffunction name="allList" access="remote" returntype="query">

        <cfscript>
            allListQry = new query();
            allListQry.setDatasource("sample");

            allListQry.setSQL("
            select *
            from suggestion,employee,result
            where
            suggestion.login_id=employee.login_id
            and
            suggestion.result_id=result.result_id
            order by suggestion.filingdate desc, suggestion.suggestion_id desc
            ");

            allListQry.execute();
        </cfscript>

        <cfreturn allListQry.execute().getresult()>
        
    </cffunction>
</component>