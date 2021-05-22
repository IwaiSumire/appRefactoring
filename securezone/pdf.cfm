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

<cfdocument  format="PDF">
    
    <div>
        <h2>今月改善提案一覧表<h2>

                <table border="3" class="tab" width="1000px" ALIGN="left">
                    <tr>
                        <td><b>タイトル</b></td>
                        <td><b>タイプ</b></td>
                        <td><b>内容</b></td>
                        <td><b>社員番号</b></td>
                        <td><b>部署</b></td>
                        <td><b>提出者</b></td>
                        <td><b>提出日</b></td>
                        <td><b>申請状況</b></td>
                    </tr>

                    <cfoutput query="excel">

                        <tr>
                            <td>#suggestion_title#</td>
                            <td>#type_name#</td>
                            <td>#suggestion_contents#</td>
                            <td>#login_id#</td>
                            <td>#department_name#</td>
                            <td>#employee_name#</td>
                            <td>#filingdate#</td>
                            <td>#result#</td>

                            
                        </tr>


                    </cfoutput>
                </table>
</cfdocument>


