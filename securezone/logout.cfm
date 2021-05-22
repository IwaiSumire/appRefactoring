<cfscript>
    // StructDelete(Session.MySessionVariable) 構造体
    // StructDelete(Session, "MySessionStructure") session変数
cflogout();
location("../login/logintop.cfm?order=logout", "false", "301");
</cfscript>