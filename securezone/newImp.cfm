<html>
    <head>
        <title>新規登録</title>
    </head>
    <body>

        <h2>新規業務改善提案登録</h2>
        <cfif isDefined("url.nullNotLogin")>
            <br>
            <font color="red">空欄を全て埋めてください</font>
        </cfif>

        <cfoutput>
        
        <form action="add.cfm" method="post">
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
        <a href="./top.cfm">
            <button type="button">TOPページに戻る</button>
        </a>
    </body>
</html>