<cfset MaxRows = 20>
<cfparam  name="top" default="1"><!---変数の存在を確認し、存在していれば設定する--->
<cfquery datasource="sample" name="allist">
    select suggestion.suggestion_title,suggestion.filingdate,employee.employee_name,result.result
    from suggestion,employee,result
    where
    suggestion.login_id=employee.login_id
    and
    suggestion.result_id=result.result_id
    </cfquery>
    
    <html>
        <head>
            <title>トップページ</title>
        </head>

        <body>
        <h2>すべての一覧表<h2>
            <table border="3">
                <tr>
                    <td><b>タイトル</b></td>
                    <td><b>提出者</b></td>
                    <td><b>提出日</b></td>
                    <td><b>申請状況</b></td>
                </tr>
            
                <cfoutput query="allist" startrow="#top#" MAXROWS="#MaxRows#">
    
                        <tr>
                            <td>#suggestion_title#</td>
                            <td>#employee_name#</td>
                            <td>#filingdate#</td>
                            <td>#result#</td>
                            <td>
                                
                                <button type="button">詳細</button>
                                </a>
                            </td>
                            <td>
                                
                                <button type="button">更新</button>
                                </a>
                            </td>
                            <td>
                                
                                <button type="button">消去</button>
                                </a>
                            </td>
                        </tr>
    
                    </cfoutput>
                </table>
                <cfset NextStart = top + MaxRows>
                <cfset Return = top - MaxRows>

                <br>
                <cfoutput>
                    <form action="top.cfm" method="post">
                        <input type="Hidden" name="return" value="#Return#">
                        <input type="submit" value="前の20件へ">
                    </form>
                    <form action="top.cfm" method="post">
                        <input type="Hidden" name="top" value="#NextStart#">
                        <input type="submit" value="次の20件へ">
                    </form>
                </cfoutput>

                <a href="./top.cfm">
                    <button type="button">TOPページに戻る</button>
                </a>

            </body>
           
    </html>