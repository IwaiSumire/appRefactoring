
<cfset MaxRows = 20>
<cfparam name = "top" default="1"><!---変数の存在を確認し、存在していれば設定する--->
<cfquery  datasource="sample" name="search">
SELECT
*
FROM
suggestion
join
employee
on
suggestion.login_id = employee.login_id
join
result
on
suggestion.result_id = result.result_id
where
suggestion.suggestion_title LIKE '%#form.search#%'
or
employee.employee_name LIKE '%#form.search#%'
or
employee.email LIKE '%#form.search#%'
</cfquery>


<table border="3" class="tab" width="1000px">
    <tr>
        <td><b>タイトル</b></td>
        <td><b>提出者</b></td>
        <td><b>提出日</b></td>
        <td><b>申請状況</b></td>
        <td><b>詳細/承認</b></td>
        <td><b>  変更  </b></td>
        <td><b>  消去  </b></td>
    </tr>

        <cfoutput query="search" startrow="#top#" MAXROWS="#MaxRows#">

            <tr>
                <td>#suggestion_title#</td>
                <td>#employee_name#</td>
                <td>#filingdate#</td>
                <td>#result#</td>
                
                <td>
                    
                    <a href="./show.cfm?suggestion_id=#suggestion_id#">
                        <button type="button">詳細/承認</button>
                    </a>
                </td>
                <td>
                    <a href="./update.cfm?suggestion_id=#suggestion_id#">
                        <button type="button">変更</button>
                    </a>
                </td>
                <td class="delete">

                    
               <a href="./delete.cfm?suggestion_id=#suggestion_id#">





                        <button type="button" >消去</button>
                    </a>
                </td>
            </tr>

        </cfoutput>
    </table>

    <br>
    <a href="./top.cfm">
        <button type="button">TOPページに戻る</button>
    </a>