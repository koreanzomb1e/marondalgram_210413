<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="timeline">
	<!-- 피드 입력창 => 로그인 상태만 -->
	<c:if test="${not empty userName}">
	<div class="border rounded">
		<textarea class="form-control mt-3 border-0" name="content" rows="3" placeholder="내용을 입력해주세요"></textarea>
		<div class="d-flex justify-content-between">
			<div class="d-flex">
				<input type="file" id="file" class="d-none" name="file" accept=".gif, .jpg, .png, .jpeg">
				<a href="#" id="fileUploadBtn">
					<img width="35" src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png">
				</a>
				
				<div id="fileName" class="ml-2"></div>
			</div>
			<button type="button" class="btn btn-sm btn-primary" id="uploadBtn">업로드</button>
		</div>
	</div>
	</c:if>
	
	<!-- 타임라인 -->
	<c:forEach var="post" items="${postList}">
	<div class="mt-3">
		<!-- 유저 이름, 삭제버튼 -->
		<div class="timeline-header d-flex justify-content-between mb-2">
			<span class="font-weight-bold ml-3">${post.userName}</span>
			<img src="https://www.iconninja.com/files/860/824/939/more-icon.png" class="mr-3" alt="삭제버튼" height="30px">
		</div>
		
		<!-- 이미지 -->
		<div class="d-flex justify-content-center">
			<img src="${post.imagePath}" width="400px">
		</div>
		
		<!-- 좋아요 -->
		<div class="d-flex mt-3">
			<img src="https://www.iconninja.com/files/214/518/441/heart-icon.png" width="20px" height="20px">
			<span class="font-weight-bold ml-2">좋아요 1개</span>
		</div>
		
		<!-- 내용 -->
		<div class="d-flex">
			<span class="font-weight-bold mr-2">${post.userName}</span>
			<span>${post.content}</span>
		</div>
		
		<!-- 댓글 -->
		<div class="comment-header">
			<span class="font-weight-bold ml-2">댓글</span>
		</div>
		
		<div class=" d-flex">
			<span class="font-weight-bold mr-2">hagulu</span>
			<span>좋아용!</span>
		</div>
	</div>
	</c:forEach>
</div>

<script>
	$(document).ready(function() {
		// 파일 업로드 이미지 클릭 -> 사용자가 파일 업로드를 할 수 있게
		$('#fileUploadBtn').on('click', function(e) {
			e.preventDefault();	// a 태그의 기본 동작을 중단
			$('#file').click();	// input file 태그를 클릭한 것과 같은 동작
		});
		
		// 사용자가 파일업로드를 했을 때 + 확장자 validation
		$('#file').on('change', function(e) {
			let fileName = e.target.files[0].name;
			
			// 확장자 validation
			let ext = fileName.split('.');
			if (ext.length < 2 ||
					ext[ext.length - 1] != 'gif'
					&& ext[ext.length - 1] != 'png'
					&& ext[ext.length - 1] != 'jpg'
					&& ext[ext.length - 1] != 'jpeg') {
				
				alert("이미지 파일만 업로드 가능합니다");
				$(this).val('');	// input file에 업로드된 상태이므로 비워주어야 한다
				return;
			}
			
			$('#fileName').text(fileName);
		});
		
		$('#uploadBtn').on('click', function() {
			// validation
			let content = $('textarea[name=content]').val();
			if (content == "") {
				alert("내용을 입력해주세요");
				return;
			}
			
			// 폼 생성 -> 서버에 보내기
			let formData = new FormData();
			formData.append("content", content);
			formData.append("file", $('input[name=file]')[0].files[0]);
			
			$.ajax({
				url: '/post/create'
				, method: 'post'
				, data: formData
				
				// 파일 업로드시 필수 파라미터들
				, processData: false
				, contentType: false
				, enctype: 'multipart/form-data'
				
				, success: function(data) {
					if (data.result == "success") {
						alert("피드가 저장되었습니다");
						location.href = '/timeline/timeline_list_view';
					} else {
						alert("피드 저장에 실패했습니다")
					}
				}
				, error: function(e) {
					alert("오류가 발생했습니다. 관리자에게 문의해주세요")
				}
			});
		});
	});
</script>