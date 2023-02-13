<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUpload</title>
</head>

<script>
	function validateForm(form) {

		if (form.name.value == "") {

			alert("작성자를 입력");
			form.name.focus();

			return false;
		}
		if (form.title.value == "") {
			alert("제목 입력");
			form.title.focus();

			return false;
		}
		if (form.attachedFile.value == "") {
			alert("첨부파일 입력");

			return false;
		}
	}
</script>
<body>
	<h3>파일 업로드</h3>
	<span style="color: red;">${errorMessage }</span>
	<form name="fileForm" method="post" enctype="multipart/form-data"
		action="UploadProcess.jsp" onsubmit="return validateForm(this);">
		작성자 : <input type="text" name="name" value="머스트해브" /> <br> 제목 :
		<input type="text" name="title" /> <br> 카테고리 : <input
			type="checkbox" name="cate" value="사진" checked /> 사진 <input
			type="checkbox" name="cate" value="과제" checked /> 과제 <input
			type="checkbox" name="cate" value="워드" checked /> 워드 <input
			type="checkbox" name="cate" value="음원" checked /> 음원<br> 첨부파일 :
		<input type="file" name="attachedFile" /> <input type="submit"
			value="전송하기" />
	</form>
</body>
</html>