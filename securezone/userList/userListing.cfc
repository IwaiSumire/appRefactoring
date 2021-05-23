<component>
    <cffunction name="userList" access="remote" returntype="query">
        <cfscript>
            userListQry = new query();
            userListQry.setDatasource("sample");
            userListQry.setSQL("
            select *
            from
            employee
            join
            department
            on
            employee.department_id = department.department_id
            join
            authority
            on
            employee.authority_id = authority.authority_id
            order by
            employee.login_id
            ");

        </cfscript>

        <cfreturn userListQry.execute().getresult()>

    </cffunction>
</component>