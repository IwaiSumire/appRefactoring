<cfquery datasource="sample" name="show">
    select *
    from suggestion,employee,result,type,department
    where
    suggestion.login_id=employee.login_id
    and
    suggestion.result_id=result.result_id
	and
	suggestion.type_id = type.type_id
	and
	employee.department_id = department.department_id
    and
    "suggestion_id" = #suggestion_id#
</cfquery>
<html>
    <head><title>詳細画面</title></head>
    <body>
        
        <cfinclude  template="header.cfm">

        <cfoutput query="show">

            <h2>詳細内容</h2>
            <table border="2">

                <tr><th>タイトル</th>
                    <td>#suggestion_title#</td></tr>
                <tr><th>提案内容</th>
                    <td>カテゴリー：#type_name#<br>
                    #suggestion_contents#</td></tr>
                <tr><th>提出日</th>
                    <td>#filingdate#</td></tr>
                <tr><th>提出者</th>
                    <td>部署：#department_name#<br>
                    社員番号：#login_id#<br>
                提出者：#employee_name#</td></tr>
                <tr><th>申請状況</th>
                    <td>#result#</td></tr>
               
              
              </table>
        
            
        <br>

        
       
        <spna><font color="red">提案者の上長のみ変更可</font></span>
        <form action="resultupdate.cfm" method="post">
            
        <input type="radio" name="result_id" value="1">未処理
        <input type="radio" name="result_id" value="2">承認
        <input type="radio" name="result_id" value="3">却下
        <input type="hidden" name="suggestion_id" value="#suggestion_id#">
        <br>
        <button type="submit">送信</button>

        </form>
    

        <br>
        <a href="./top.cfm">
            <button type="button">TOPページに戻る</button>
        </a>
    </cfoutput>
    </body>
</html>