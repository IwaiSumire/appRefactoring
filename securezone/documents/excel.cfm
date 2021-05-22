<cfquery datasource="sample" name="excel">
    select *
    from suggestion
    join employee
    on suggestion.login_id=employee.login_id
    join result
    on suggestion.result_id=result.result_id
    join type
    on
    suggestion.type_id =type.type_id
    join department
    on employee.department_id = department.department_id
    where
    date_part('month',now())=date_part('month',suggestion.filingdate)
</cfquery>

<cfspreadsheet  
    action="write"
    filename = "filepath"
    overwrite = "true"
    password = "password"
    query = "excel"
    sheetname = "text"
    autosize = "true" >