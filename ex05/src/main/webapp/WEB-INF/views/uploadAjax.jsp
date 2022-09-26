<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Upload with Ajax</h1>

<div class='uploadDiv'>
	<input type='file' name='uploadFile' multiple>
</div>

<button id='uploadBtn'>upload</button>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js" integrity="sha512-+NqPlbbtM1QqiK8ZAo4Yrj2c4lNQoGv8P79DPtKzj++l5jnN39rHA/xsqn8zE9l0uSoxaCdrOgFs6yjyfbBxSg==" crossorigin="anonymous"></script>
<script>

var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
var maxSize = 5242880; // 5MB

function checkExtension(fileName, fileSize) {
	console.log("check 실행");
	console.log(fileName);
	console.log(fileSize);
	console.log(regex.test(fileName));
	
	
	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
	
	if(regex.test(fileName)){
		alert("해당 종류의 파일은 업로드 할 수 없습니다.");
		return false;
	}
	return true;
	
}

$("#uploadBtn").on("click", function(e){
	console.log("uploadBtn 클릭");
	var formData = new FormData();
	
	var inputFile = $("input[name='uploadFile']");
	
	var files = inputFile[0].files;
	
	console.log(files);
	
	for (var i = 0; i < files.length; i++) {
		
		if(!checkExtension(files[i].name, files[i].size)){
			return false;
		}
		
		formData.append("uploadFile",files[i]);
		
	}
	
	$.ajax({
		url: '/uploadAjaxAction',
		processData : false,
		contentType : false,
		data : 	formData,
				type : 'POST',
				dataType : 'json',
				success : function(result){
					console.log(result);
					alert("Uploaded");
				}
				
		
	}); //$.ajax
	
});

	$(document).ready(function(){
		

		
		
		
		
		
		

		
	})
</script>



</body>
</html>