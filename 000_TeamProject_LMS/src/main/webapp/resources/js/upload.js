$(document).ready(function(){
	console.log("무조건 진입");
    $("#upload").change(function(){  
    	console.log("체인지문은 대체 언제들어오는가");
        var file=this.files[0];
        var imageFile=file.type;
        var match=["image/jpeg","image/png","image/jpg"];

        if(!((imageFile==match[0]) || (imageFile==match[1]) || (imageFile==match[2]))){
            $("#type").text("Only Jpeg/ Jpg /Png /Gif are allowed");
            console.log("이프문 안쪽 사진선택시?");
            return false;
        } else {
        	console.log("엘스문 안쪽");
            $("#type").hide();
//            alert("required");
            var reader=new FileReader();
            reader.onload=imageIsLoaded;
            reader.readAsDataURL(this.files[0]);
        }
    });

    function imageIsLoaded(e){
        $("#imageReader").attr('src', e.target.result);
        $(".camera").hide();
        $("#imgRead").show();
    }
});	