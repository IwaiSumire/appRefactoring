<html>
    <head>
        <title>新規登録</title>
        <script type="text/javascript" src="../../js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="../../js/top.js"></script>
        <script type="text/javascript" src="../../js/header.js"></script>
        <link rel="stylesheet" href="../../style/top.css">
        <link rel="stylesheet" href="../../style/suggestionAdd.css">
    </head>
    <body>

        <cfinclude  template="../header.cfm">

        <div class="sugges">
        <h2>新規業務改善提案登録</h2>

        <cfscript>
            if(isDefined("url.nullNotLogin")) {
                writeOutput('<br>
                <font color="red">空欄を全て埋めてください <br></font>
               ')
            }
        </cfscript>

        <cfif isDefined("form.action") and form.action is "suggestionAdd">
            <cfinvoke  method="suggestionAdd" component="suggestionAdding">
                <cfinvokeargument name="suggestion_title" value="#form.suggestion_title#">
                <cfinvokeargument name="type_id" value="#form.type_id#">
                <cfinvokeargument name="login_id" value="#form.login_id#">
                <cfinvokeargument name="filingdate" value="#form.filingdate#">
                <cfinvokeargument name="login_id" value="#form.login_id#">
            </cfinvoke>
        </cfif>

        <cfoutput>
        
        <form action="#cgi.script_name#" method="post">
        <input type="hidden" name="action" value="suggestionAdd">
            タイトル：
            <input type="text" name="suggestion_title" size="30">
            <br>
            提案内容：
            <textarea name="suggestion_contents" rows="4" cols="40"></textarea>
            <br>
            カテゴリ：<input type="radio" name="type_id" value="1" checked="checked">経費削減
            <input type="radio" name="type_id" value="2">整理整頓
            <input type="radio" name="type_id" value="3">業務効率
            <br>
            提 出 日 ：
            <input type="date" name="filingdate">
            <br>
            <!---申請状態：--->
            <input type="hidden" name="result_id" value="1">
            <!---ここは後でcookieで勝手に受け取るようにするこｔ--->
            社員番号：
            <input type="text" name="login_id" size="5" value="#cookie.clogin_id#">
            <br>
            <br>
            <input type="submit" value="追加">
        </form>
    </cfoutput>
        <br>
    </div>
    </body>
</html>