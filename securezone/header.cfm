<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ヘッダー</title>

    <link rel="stylesheet" href="../style/header.css?v=2">

    <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../js/header.js"></script>
    

</head>

<body>

    <header class="head">

        <cfoutput>
            <br>
            <h1>株式会社岩井 改善提案ワークフロー</h1>
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

            <a href="./logout.cfm">
                <button type="button" class="btn">ログアウト</button>
            </a>
            <a href="./usershow.cfm">
                <button type="button" class="btn">登録社員一覧はこちら</button>
            </a>

        </div>

    </nav>

    


</body>

</html>