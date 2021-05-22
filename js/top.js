
$(function () {
    $('.tooltip').hide();//まず隠しておく

    $('#search').hover(//searchの上に乗ったときにフェードイン、アウトする
        function () {
            $('.tooltip').fadeIn('fast');
        },
        function () {
            $('.tooltip').fadeOut('fast');
        });

    $('.delete').hide();//まず隠しておく
   

    $('.deletebtn').hover(//searchの上に乗ったときにフェードイン、アウトする
        function () {
            $('.delete').fadeIn('fast');
            $(this).css('background-color','red');
        },
        function () {
            $('.delete').fadeOut('fast');
            $(this).css('background-color', '');
        });

});