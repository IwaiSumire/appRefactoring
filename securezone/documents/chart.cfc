<cfcomponent>
    <cffunction name="departmentChart" access="remote" returntype="query">
        <cfscript>
            departmentLankQry = new query();
            departmentLankQry.setDatasource("sample");
            departmentLankQry.setSQL("
            select department.department_name,count(*) as count
            from suggestion
            join employee
            on suggestion.login_id=employee.login_id
            join department
            on employee.department_id = department.department_id
            where   date_part('year',now())=date_part('year',suggestion.filingdate)
            group by department.department_name
            ");
        </cfscript>
        <cfreturn departmentLankQry.execute().getresult()>
    </cffunction>


    <cffunction name="userChart" access="remote" returntype="query">
        <cfscript>
            userLankQry = new query();
            userLankQry.setDatasource("sample");
            userLankQry.setSQL("
            select employee.employee_name,count(*) as count
            from suggestion
            join employee
            on suggestion.login_id=employee.login_id
            where date_part('year',now())=date_part('year',suggestion.filingdate)
            group by employee.employee_name
            order by count desc
            limit 5
            ");
        </cfscript>
        <cfreturn userLankQry.execute().getresult()>
    </cffunction>
</cfcomponent>