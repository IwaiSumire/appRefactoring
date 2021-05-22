<cfset MaxRows=20>
    <cfparam name="top" default="1">
        <!---変数の存在を確認し、存在していれば設定する--->
        <cfquery datasource="sample" name="toplist">
            select *
            from suggestion,employee,result
            where
            suggestion.login_id=employee.login_id
            and
            suggestion.result_id=result.result_id
            and
            date_part('month',now())=date_part('month',suggestion.filingdate)
        </cfquery>

        <html>

            <body>
                <head>
                    <title>トップページ</title>
    
                    <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
                    <script type="text/javascript" src="../js/top.js"></script>
                    <script type="text/javascript" src="../js/header.js"></script>
                    <link rel="stylesheet" href="../style/top.css">
    
    
                </head>

             

                <header class="head">

                    <cfoutput>
                        <br>
                        <h1>株式会社岩井 改善提案管理アプリ</h1>
                        <h3>現在のログインユーザー：#cookie.cemployee_name#さん</h3>
            
                    </cfoutput>
            
                </header>
            
                <nav>
            
                    <div class="headbtn">
            
                        <a href="./all_list.cfm">
                            <button type="button" class="btn">過去の全てのリスト</button>
                        </a>
            
                        <a href="./newImp.cfm">
                            <button type="button" class="btn">新規登録はこちら</button>
                        </a>
                        <a href="./usershow.cfm">
                            <button type="button" class="btn">登録社員一覧はこちら</button>
                        </a>
                        <a href="./chart.cfm">
                            <button type="button" class="btn">比較グラフはこちら</button>
                        </a>
                        <a href="./logout.cfm">
                            <button type="button" class="btn">ログアウト</button>
                        </a>
            
                    </div>
            
                </nav>
                

                <div class="sabtitle">
                <h2>今月の改善提案一覧表<h2>

                        <form action="search.cfm" method="post" class="margin">
                            <span class="search">条件に一致するものを検索する</span>
                            <input type="search" name="search" placeholder="キーワードを入力">
                            <input type="submit" value="検索" id="search" class="inli">
                            <p class="tooltip">検索ができます。</p>
                        </form>

                        
                        <a href="./pdf.cfm">
                            <button type="button" class="pdfbtn">PDF出力</button>
                        </a>
                        <a href="./excel.cfm">
                            <button type="button" class="pdfbtn">Excel出力</button>
                        </a>

                    </nav>
                </div>


                
                        <table border="3" class="tab" width="1000px" ALIGN="left">
                            <tr>
                                <td><b>タイトル</b></td>
                                <td><b>提出者</b></td>
                                <td><b>提出日</b></td>
                                <td><b>申請状況</b></td>
                                <td><b>詳細/承認</b></td>
                                <td><b> 変更 </b></td>
                                <td><b> 消去 </b></td>
                            </tr>

                            <cfoutput query="toplist" startrow="#top#" MAXROWS="#MaxRows#">

                                <tr>
                                    <td>#suggestion_title#</td>
                                    <td>#employee_name#</td>
                                    <td>#filingdate#</td>
                                    <td>#result#</td>

                                    <td class="tbbtn">

                                        <a href="./show.cfm?suggestion_id=#suggestion_id#">
                                            <button type="button">詳細/承認</button>
                                        </a>
                                    </td>
                                    <td class="tbbtn">
                                        <a href="./update.cfm?suggestion_id=#suggestion_id#">
                                            <button type="button">変更</button>
                                        </a>
                                    </td>
                                    <td class="tbbtn">


                                        <a href="./delete.cfm?suggestion_id=#suggestion_id#">

                                            <button type="button" class="deletebtn">消去</button>

                                        </a>

                                    </td>
                                </tr>


                            </cfoutput>
                        </table>
                        <div class="deletepop">
                            <div class="delete"> 消去は本人か管理者しか行えません!! </div>
                        </div>


                        <cfset NextStart=top + MaxRows>
                            <cfset Return=top - MaxRows>


                                <br>

                                <div class="nexrbtn">
                                    <cfoutput>
                                        <br>
                                        <form action="top.cfm" method="post">
                                            <input type="Hidden" name="return" value="#Return#">
                                            <input type="submit" value="前の20件へ">
                                        </form>
                                        <form action="top.cfm" method="post">
                                            <input type="Hidden" name="top" value="#NextStart#">
                                            <input type="submit" value="次の20件へ">
                                        </form>

                                    </cfoutput>
                                </div>

            </body>

        </html>