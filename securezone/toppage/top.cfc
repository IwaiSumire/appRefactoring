<component>
    <cffunction name="toplist" access="remote" returntype="query">
        <cfquery datasource="sample" name="NowMonthList">
        select *
        from suggestion,employee,result
        where
        suggestion.login_id=employee.login_id
        and
        suggestion.result_id=result.result_id
        and
        date_part('month',now())=date_part('month',suggestion.filingdate)
        </cfquery>
        <cfreturn NowMonthList>
    </cffunction>
</component>

<!---
component accessors = "true" {
    
    
    public query function toplist() {

      script {}
        select *
        from suggestion,employee,result
        where
        suggestion.login_id=employee.login_id
        and
        suggestion.result_id=result.result_id
        and
        date_part('month',now())=date_part('month',suggestion.filingdate)
                
        return NowMonthList;
    }
}
--->