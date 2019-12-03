$(document)
.ready(function(){
    // var s = true;
    $('#datepicker1').datepicker({
        dateFormat: 'yy-mm-dd',
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        // minDate: new Date(year, month, 1),
        // maxDate: new Date(year, month, 30),
        hideIfNoPrevNext: false,
        showMonthAfterYear: true,
        yearSuffix: '년',
        onSelect: function(dateText, inst) {
            var date = $(this).val();
            var year = parseInt(date.substr(0,4));
            var month = parseInt(date.substr(5,2))-1;
            var day = parseInt(date.substr(8,2));
            if($('#fromdate').val()==""){
                $('#fromdate').val(date);
                $('#todate').val(moment(new Date(year, month, day)).format('YYYY-MM-DD'));
                $('#datepicker1').datepicker("option", "minDate", date);
            }else{
                $('#todate').val(date); 
            }
        }
    })  
})
.on("click",".saveBTN",function(){
	if($('#fromdate').val()=='' || $('#todate').val()==''){
    	alert('다시확인');
    	return false;
    }
    $("#sch").submit();
})
.on("click",".resetBTN",function(){
    //form내용 리셋
    $( "#sch" ).each( function () {
        this.reset();
    });
    $('#datepicker1').datepicker("option", "minDate", new Date(2019,4,1));
})