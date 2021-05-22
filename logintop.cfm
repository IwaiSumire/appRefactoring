<cfif isDefined("url.nullNotLogin")>
  <br>
  <center>
    <font color="white">社員IDかパスワードに空欄があります。</font>
  </center>
</cfif>
<cfif isDefined("url.badLogin")>
  <br>
  <center>
    <font color="white">登録がないようです。</font>
  </center>
  <center>
    <font color="white">新規の場合は会員登録をしてください。</font>
  </center>
</cfif>
<cfif isDefined("url.logout")>
  <br>
  <center>
    <font color="white">登録がないようです。</font>
  </center>
  <center>
    <font color="white">新規の場合は会員登録をしてください。</font>
  </center>
</cfif>


<html>

<head>
  <title>ログインフォーム</title>
  <link rel="stylesheet" type="text/css" href="style/logintop.css">
  <script>
    $(document).ready(function (e) {
      $('h6').on('click', function () {
        $('.social').stop().slideToggle();
      });
    })
  </script>
</head>

<body>
  <form action="dologin.cfm" method="post">
    <h1><span>Life's</span> Good</h1>
    <input placeholder="Userid" type="text" name="login_id" />
    <input placeholder="Password" type="password" name="login_pass" />
    <button class="btn">Log in</button>
    <h6>Oh, social?</h6>
    <div class="social">
    </div>
  </form>
</body>
<footer>
  <h5>click! <a href="./useradd.cfm">ユーザ新規</a></h5>
  <h5>click! <a href="./description.html">アプリの説明</a></h5>

</footer>

</html>