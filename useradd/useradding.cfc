<cfcomponent>
    <cffunction name="useradd" access="remote" returntype="string">

        <cfscript>

            //空欄がないとき
            if ((form.employee_name is not "" )
            and 
            (form.department_id is not "" )
            and
            (form.login_id is not "" )
            and
            (form.login_pass is not "" )
            and
            (form.email is not "" )) {

                searchUserQry = new query();
                searchUserQry.setdatasource("sample");

                searchUserQry.setsql("
                select *
                from employee
                where login_id = :loginId
                ");

                searchUserQry.addparam(name="loginId" , value="#form.login_id#" , cfsqltype="cf_sql_numeric");
                serchReslt = searchUserQry.execute();

                //入力のバリデーションチェックに引っかかったとき
                if (NOT ( len(form.login_pass) >= 6 AND refind('[A-Z]',form.login_pass) AND refind('[a-z]',form.login_pass)
                AND refind('[0-9]',form.login_pass) )) {

                writeOutput('
                <meta http-equiv="refresh" content="0;url=useradd.cfm?validation=yes">');

                //既に社員番号が登録済の場合
                } else if (serchReslt.getResult().recordCount > 0) {
                    writeOutput('
                    <meta http-equiv="refresh" content="0;url=useradd.cfm?Notadd=yes">');
                    
                //入力に問題がないのでユーザ登録をする
                } else {

                    hashPass = hash(form.login_pass,'SHA-256');

                    addUserQry = new query();
                    addUserQry.setdatasource("sample");

                    addUserQry.setsql("
                    insert into employee
                    (
                    employee_name,department_id,login_id,login_pass,email,authority_id
                    )
                    values
                    (
                     :employee_name, :department_id, :login_id, :login_pass, :email, :authority_id)");
                    
                     addUserQry.addparam(name="employee_name", value="#form.employee_name#", cfsqltype="cf_sql_varchar");
                     addUserQry.addparam(name="department_id", value="#form.department_id#", cfsqltype="cf_sql_numeric");
                     addUserQry.addparam(name="login_id", value="#form.login_id#", cfsqltype="cf_sql_numeric");
                     addUserQry.addparam(name="login_pass", value="#hashPass#", cfsqltype="cf_sql_varchar");
                     addUserQry.addparam(name="email", value="#form.email#", cfsqltype="cf_sql_varchar");
                     addUserQry.addparam(name="authority_id", value="#form.authority_id#", cfsqltype="cf_sql_numeric");

                     addUserQry.execute();

                     savecontent variable="mailBody" {
                        writeOutput( "#form.employee_name#様のユーザ登録が完了致しました。" );
                      };
                      
                      // Create and populate the mail object
                      mailService = new mail(
                        to = "#form.email#",
                        from = "sender@example.com",
                        subject = "業務改善提案アプリユーザ登録完了のお知らせ",
                        body = mailBody
                      );
                      
                      // Send
                      mailService.send();

                      location("useraddpop.cfm", "false", "301");

                }

                //空欄があったとき   
                } else {
                writeOutput('
                <meta http-equiv="refresh" content="0;url=useradd.cfm?nullNotLogin=yes">');
                
            }
            
        </cfscript>
    </cffunction>
</cfcomponent>