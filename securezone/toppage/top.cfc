<component>
    <cffunction name="toplist" access="remote" returntype="query">

        <cfscript>
            nowMonthListQry = new query();
            nowMonthListQry.setDatasource("sample");

            nowMonthListQry.setSQL("
            select *
            from suggestion,employee,result
            where
            suggestion.login_id=employee.login_id
            and
            suggestion.result_id=result.result_id
            and
            date_part('month',now())=date_part('month',suggestion.filingdate)");

            nowMonthListQry.execute();
        </cfscript>

        <cfreturn nowMonthListQry.execute().getresult()>
        
    </cffunction>
</component>