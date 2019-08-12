<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>  
    
<html>
<body>
 
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    
     <c:if test="${deleteCnt == 0}">
        <script type="text/javascript">
            errorAlert("회원탈퇴 실패!");    
            window.location="mypage";
        </script>
    </c:if>
    
    <c:if test="${deleteCnt != 0}">
        
        <script type="text/javascript">
            alert("회원탈퇴 완료!!!");
            window.location="/login";
        </script>        
    
    </c:if>
 
 
</body>
</html>