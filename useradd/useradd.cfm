
<html>
    <head><title>会員登録</title></head>
    <body>
        <div class="bg">
        <h2>会員登録</h2>

        <cfscript>

            if (isDefined("url.nullNotLogin")) {
                writeOutput(
                '<br>
                <font color="red">全て必須項目です</font>');
            } else if (isDefined("url.Notadd")) {
            writeOutput(
           '<br>
            <font color="red">その社員IDは既に使われています</font>'
            );
            } else if (isDefined("url.validation")) {
                writeOutput(
            '<br>
            <font color="red">
                <ul>
                    <li>パスワードは6文字以上に設定してください。</li>
                    <li>大文字を必ず使用してください。</li>
                    <li>小文字を必ず使用してください</li>
                    <li>数字を必ず使用してください。</li>
                </ul>
            </font>'
                )
            };

        </cfscript>

        <cfif isDefined("form.action") and form.action is "useradd">
            <cfinvoke  method="useradd" component="useradding">
                <cfinvokeargument name="employee_name" value="#form.employee_name#">
                <cfinvokeargument name="department_id" value="#form.department_id#">
                <cfinvokeargument name="login_id" value="#form.login_id#">
                <cfinvokeargument name="login_pass" value="#form.login_pass#">
                <cfinvokeargument name="email" value="#form.email#">
                <cfinvokeargument name="authority_id" value="#form.authority_id#">
            </cfinvoke>
        </cfif>

        <form action="<cfoutput>#cgi.script_name#</cfoutput>" method="post">
        <input type="hidden" name="action" value="useradd">
            <p>お名前：<br>
            <input type="text" name="employee_name"></p>
            <p>所属部署：<br>
                <input type="radio" name="department_id" value="1" checked="checked">営業部
                <input type="radio" name="department_id" value="2">総務部
                <input type="radio" name="department_id" value="3">開発部
                <input type="radio" name="department_id" value="4">製造部
            </p>
            <p>社員番号：<br>
                <input type="text" name="login_id"></p>
            <p>パスワード：<br>
            <input type="password" name="login_pass"></p>
            <p>メールアドレス<br>
            <input type="text" name="email"></p>
            <input type="radio" name="authority_id" value="1">管理者
            <input type="radio" name="authority_id" value="2" >承認者
            <input type="radio" name="authority_id" value="3" checked>ユーザ
            <br>
            <br>
            <input type="submit">
        </form>

        <a href="../login/logintop.cfm">
            <button type="button">TOPページに戻る</button>
        </a>
    </div>
    </body>
</html>