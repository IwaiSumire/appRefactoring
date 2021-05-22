//もし空欄がればエラー

<cfdump var="#form#">

<cfif (form.employee_name is not "" ) and (form.department_id is not "" ) and (form.login_id is not "" ) and
    (form.login_pass is not "" ) and (form.email is not "" )>

    <cfquery datasource="sample" name="idpass">
        select *
        from employee
        where '#form.login_id#' = login_id
    </cfquery>

    <cfset login_pass=#hash(login_pass,'SHA-256')#>


        //もしパスワードがバリデーションにひっかかったらエラー

        <cfif NOT ( len(form.login_pass) GTE 6 AND refind('[A-Z]',form.login_pass) AND refind('[a-z]',form.login_pass)
            AND refind('[0-9]',form.login_pass) )>
            <meta http-equiv="refresh" content="0;url=useradd.cfm?passnot5=yes">


            //もし登録しようとしたIDが既に使用されていれば



            <cfelseif idpass.recordCount neq 0>

                <meta http-equiv="refresh" content="0;url=useradd.cfm?Notadd=yes">




                //全てのエラーチェックにひっかからなければ登録する

                <cfelse>

                    <cfquery datasource="sample">
                        insert into employee
                        (
                        employee_name,department_id,login_id,login_pass,email,authority_id
                        )
                        values
                        (
                        '#employee_name#',#department_id#,#login_id#,'#login_pass#','#email#','#authority_id#'
                        )
                    </cfquery>

                    <cfmail to="#email#"
                    from="#email#"
                    subject="新規会員登録完了のお知らせ"
                    type="html">

                    <p>ID:#employee_name#様</p>
                    <p>改善提案アプリで会員登録が完了しました。</p>
                    <p>登録されたユーザIDは#login_id#です。</p>
                    
                    </cfmail>

                   

                    <cflocation url="./useraddpop.cfm">

        </cfif>

        <cfelse>

            <meta http-equiv="refresh" content="0;url=useradd.cfm?nullNotLogin=yes">

</cfif>