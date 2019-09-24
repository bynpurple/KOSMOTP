<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %> 
<html>
<body>
<c:if test="${Cnt == 0}">
        
        <script type="text/javascript">
            alert(" 삭제 실패! \n 다시 시도해주십시오.");
            window.self.close();
        </script>
    
    </c:if>
 
 
    <c:if test="${Cnt != 0}">
    
        <script type="text/javascript">
            alert("삭제가 완료되었습니다!");
            window.self.close();
        </script>
    
        <%--  <c:redirect src="board.box?pageNum= ${pageNum}" /> --%>
    </c:if>
</body>
</html>
