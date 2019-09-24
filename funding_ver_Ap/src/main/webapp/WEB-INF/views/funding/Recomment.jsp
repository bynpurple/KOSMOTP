<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/header.jsp" %>     
<html>
<script src="/stock/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$('#commentCompleted').click(function() {		
		$('#result').css("visibility", "visible");	// 결과 있으면 보여줌
		var commentId = $('#commentId').val();
		var commentPwd = $('#commentPwd').val();
		var comment =$('#comment').val();
		var qna_comment = $('#qna_comment').val();
		var qna_id = $('#qna_id').val();
		var qna_date = $('#qna_date').val();
		
		$.ajax({
			type:"GET",
			data: "commentId=" + commentId + "&commentPwd="+commentPwd +"&comment="+comment+"&qna_id="+qna_id+"&qna_comment="+qna_comment+"&qna_date="+qna_date,
			url: '${pageContext.request.contextPath}/user/replyeComment',	// {컨트롤러}/이동 url
			success: function(data) {
				$('#result').html(data);
				
			},
			error: function() {
				alert('오류');
			}
		});
	});
});

function deletereple(DelcommentId,reple_date,qnaid,comment){
	var DelcommentPwd = prompt("비밀 번호를 입력 해주세요 : ");	
	
	$(function(){
	$.ajax({
		type:"GET",
		data: "DelcommentPwd="+DelcommentPwd+"&DelcommentId="+DelcommentId+"&qna_id="+qnaid+"&qna_comment="+comment+"&reple_date="+reple_date,
		url: '${pageContext.request.contextPath}/user/deleteReple',	// {컨트롤러}/이동 url
		success: function(data) {
			$('#result').html(data);
			
		},
		error: function() {
			alert('다시 한번 시도 해주세요');
			}
		});	
	});
}	
</script>
<body>
	<div class="col-md-12" >
	<table class="table">
	  <thead>	
		<tr>
			<th>ID</th>
			<th>${qna_id}<input type="hidden" id="qna_id" value="${qna_id}"></th>
		</tr>
	  </thead>
	  <tbody>
		<tr>
			<td>내용</td>
			<td>${qna_comment}
			<input type="hidden" id="qna_comment"  value="${qna_comment}">
			<input type="hidden" id="qna_date" value="${qna_date}">
			</td>
		</tr>	  
	  </tbody>
	</table>
	<br>
	<div style="height:450px; overflow:auto;" id="result">
		<c:forEach var="list" items="${list}">
		<p class="tpr-name">ID : <span style="font-weight:bold;">${list.reple_id}</span>&nbsp;<span class="tpr-date">${list.reple_date}</span>
		<button type="button" class="close" onclick="deletereple('${list.reple_id}','${list.reple_date}','${qna_id}','${qna_comment}');">×</button>
		</p>
		<p class="tpr-content">${list.reple_comment}</p>
		<hr>
		</c:forEach>
	</div>
	<div class="comment-form">
     <h4 class="blog-section-title">답글 달기</h4>
       <!-- Name -->
       <div class="form-group">
         <input type="text" class="col-md-6" id="commentId" name="commentId" placeholder="아이디를 입력하세요" required>
       	 <input type="password" class="col-md-6" id="commentPwd" name="commentPwd" placeholder="비밀번호를 입력하세요" required>	
       </div>
       
       <!-- Comment -->
       <div class="col-md-12 form-group no-gap">
         <textarea class="form-control" name="textarea" id="comment" name="comment" rows="5" placeholder="Your Comment" required></textarea>
       </div>

       <input type="button" value="답글 달기 완료" id="commentCompleted" class="btn pull-right">
     </div><!-- / .comment-form -->
     </div>
</body>
</html>