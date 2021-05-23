<cfinvoke  method="userList" component="userListing" returnvariable="userList">
</cfinvoke>
<!DOCTYPE html>
<html lang="ja">
        
        <title>登録ユーザ確認</title>
        <script type="text/javascript" src="../../js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="../../js/top.js"></script>
        <script type="text/javascript" src="../../js/header.js"></script>
        <script type="text/javascript" src="../../js/usershow.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.1/js/jquery.tablesorter.min.js"></script>
        <link rel="stylesheet" href="../../style/usershow.css">
        <link rel="stylesheet" href="../../style/top.css">
</body>

</html>


<cfinclude  template="../header.cfm">

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
        
                <cfoutput query="userList">

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