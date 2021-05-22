<cfquery datasource="sample" name="usershow">
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
    </cfquery>


<!DOCTYPE html>
<html lang="ja">
        
        <title>登録ユーザ確認</title>
    
        <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="../js/usershow.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.1/js/jquery.tablesorter.min.js"></script>
        <link rel="stylesheet" href="../style/usershow.css?v=2">
</body>

</html>




<table border="3" class="tablesorter" id="myTable" width="1000px">

    <thead>
            <tr>
                <td><b>社員番号</b></td>
                <td><b>部署</b></td>
                <td><b>社員名</b></td>
                <td><b>パスワード</b></td>
                <td><b>メールアドレス</b></td>
                <td><b>権限</b></td>
    </thead>
            </tr>
        
                <cfoutput query="usershow">

                    <tr>
                        <td>#login_id#</td>
                        <td>#department_name #</td>
                        <td>#employee_name#</td>
                        <td>************</td>
                        <td>#email#</td>
                        <td>#authority#</td>
                        
                    </tr>

                </cfoutput>
           
            </table>
        </body>
</html>