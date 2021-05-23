<cfinvoke method="departmentChart" component="chart" returnvariable="departmentLank">
</cfinvoke>
<cfinvoke method="userChart" component="chart" returnvariable="userLank">
</cfinvoke>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>チャート</title>
    <script type="text/javascript" src="../../js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../../js/top.js"></script>
    <script type="text/javascript" src="../../js/header.js"></script>
    <link rel="stylesheet" href="../../style/top.css">
</head>
<body>

    <cfinclude  template="../header.cfm">

    <h2>今年の部署ごとの提出件数比較</h2>
    
        <cfchart format="html" pieslicestyle="solid" chartWidth="600" chartHeight="400">
        <cfchartseries query="departmentLank" type="pie" serieslabel="count" valuecolumn="count" itemcolumn="department_name">
        </cfchartseries>
        </cfchart>
        <br>
        <br>
        <h2>今年の提出件数上位5名</h2>
        <cfchart format="html" pieslicestyle="solid" chartWidth="600" chartHeight="400">
        <cfchartseries query="userLank" type="bar" serieslabel="count" valuecolumn="count" itemcolumn="employee_name">
        </cfchartseries>
        </cfchart>

        <br>
        <br>
        <br>
        <br><br>
        <br><br>
        <br><br>
        
</body>
</html>