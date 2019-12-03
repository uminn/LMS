$(document)
.on("click","#search",function(){
    $(".eval_content1,#change2-content,#change4-content-1").css("display","block");
})
.on("click",".InsertBTN",function(){
    $("#wrap").css("display","none");
    $("#wrap1").css("display","block");
})
