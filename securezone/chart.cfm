<cfquery datasource="sample" name="chart">
    select department.department_name,count(*) as count
    from suggestion
    join employee
    on suggestion.login_id=employee.login_id
    join department
    on employee.department_id = department.department_id
    where   date_part('year',now())=date_part('year',suggestion.filingdate)
    group by department.department_name
</cfquery>
<cfquery datasource="sample" name="top5">
    select employee.employee_name,count(*) as count
    from suggestion
    join employee
    on suggestion.login_id=employee.login_id
    group by employee.employee_name
	order by count desc
	limit 5
</cfquery>

<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>チャート</title>
</head>
<body>
    <h2>今季の部署ごとの提出件数比較</h2>
    
        <cfchart format="html" pieslicestyle="solid" chartWidth="600" chartHeight="400">
        <cfchartseries query="chart" type="pie" serieslabel="count" valuecolumn="count" itemcolumn="department_name">
        </cfchartseries>
        </cfchart>

        <h2>今季の提出件数上位5名</h2>
        <cfchart format="html" pieslicestyle="solid" chartWidth="600" chartHeight="400">
        <cfchartseries query="top5" type="bar" serieslabel="count" valuecolumn="count" itemcolumn="employee_name">
        </cfchartseries>
        </cfchart>

</body>
</html>