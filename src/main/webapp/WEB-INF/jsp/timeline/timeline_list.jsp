<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="timeline">
	<!-- 피드 입력창 => 로그인 상태만 -->
	<c:if test="${not empty userName}">
	<div>
		<textarea class="form-control mt-3" rows="3" placeholder="내용을 입력해주세요"></textarea>
		<div class="d-flex justify-content-between">
			<input type="file">
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
			<span class="font-weight-bold mr-2">${post.content}</span>
			<span>어쩌구 저쩌구ㅋㅋ</span>
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