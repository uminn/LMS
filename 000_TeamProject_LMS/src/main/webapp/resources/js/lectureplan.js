$(document).ready(function(){
    $(".mid_datepicker,.final_datepicker,.homework_datepicker,.mid1_datepicker,.final1_datepicker").datepicker({
        dateFormat: 'yy-mm-dd',
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        hideIfNoPrevNext: false,
        showMonthAfterYear: true,
        yearSuffix: '년',
        minDate: new Date(2019,4,1)
    })
})
//날짜
.on('change','#mid_fromdate,#final_fromdate,#homework_fromdate,#mid1_fromdate,#final1_fromdate',function(){
    var str = $(this).val(); // 2019-09-23
    var year = parseInt(str.substr(0,4)); // 2019
    var month = parseInt(str.substr(5,2))-1; // 09 -1
    var day = parseInt(str.substr(8,2))+1; // 23 +1

    $("#mid_todate,#final_todate,#homework_todate,#mid1_todate,#final1_todate").datepicker( "option", "minDate", new Date(year, month, day) );
})