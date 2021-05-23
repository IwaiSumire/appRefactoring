<cfinvoke method="updateItem" component="updating" returnvariable="updateItem">
    <cfinvokeargument  name="suggestion_id"  value="#suggestion_id#">
</cfinvoke>

<html>
    <title>更新</title>
    <body>
        <h2>内容の更新</h2>

        <cfscript>
            if(isDefined("url.nullNotLogin")) {
                writeOutput('<br>
                <font color="red">空欄を全て埋めてください <br></font>
               ')
            }
        </cfscript>

            <cfif isDefined("form.action") and form.action is "update">
                <cfinvoke  method="updating" component="updating">
                    <cfinvokeargument name="suggestion_title" value="#form.suggestion_title#">
                    <cfinvokeargument name="type_id" value="#form.type_id#">
                    <cfinvokeargument name="login_id" value="#form.login_id#">
                    <cfinvokeargument name="filingdate" value="#form.filingdate#">
                    <cfinvokeargument name="login_id" value="#form.login_id#">
                    <cfinvokeargument name="suggestion_id" value="#form.suggestion_id#">
                </cfinvoke>
            </cfif>

            <cfoutput query="updateItem">
            <form action="#cgi.script_name#" method="post">
            <input type="hidden" name="action" value="update">
                タイトル：
                <input type="text" name="suggestion_title" size="30" value="#Trim(suggestion_title)#">
                <br>
                提案内容：
                <textarea name="suggestion_contents" rows="4" cols="40">#Trim(suggestion_contents)#</textarea>
                <br>
                カテゴリ：
                <input type="radio" name="type_id" value="1"  checked="checked">経費削
                <input type="radio" name="type_id" value="2">整理整頓
                <input type="radio" name="type_id" value="3">業務効率
                <br>
                提 出 日 ：
                <input type="date" name="filingdate" value="#Trim(filingdate)#">
                <br>
                <!---ここは後でcookieで勝手に受け取るようにするこｔ--->
                社員番号：
                <input type="text" name="login_id" size="5" value="#cookie.clogin_id#">
                <br>
                <br>
                <input type="hidden" name="suggestion_id" value="#url.suggestion_id#">
                <input type="submit" value="変更">
            </form>
            <br>
    </cfoutput>
    </body>
</html>
