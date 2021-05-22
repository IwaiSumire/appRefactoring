<cfquery datasource="sample" name="update">
    select *
    from suggestion
    WHERE "suggestion_id"=#suggestion_id#
</cfquery>
<html>
    <title>更新</title>
    <body>
        <h2>内容の更新</h2>

        <cfoutput query="update">
        
            <form action="uptating.cfm" method="post">
                タイトル：
                <input type="text" name="suggestion_title" size="30" value="#Trim(suggestion_title)#">
                <br>
                提案内容：
                <textarea name="suggestion_contents" rows="4" cols="40">#Trim(suggestion_contents)#</textarea>
                <br>
                カテゴリ：
                <input type="radio" name="type_id" value="1">経費削減
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
                <input type="hidden" name="suggestion_id" value="#suggestion_id#">
                <input type="submit" value="変更">
            </form>
            <br>
            <a href="./top.cfm">
                <button type="button">TOPページに戻る</button>
            </a>

    </cfoutput>
    </body>
</html>