<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<html>
<body>
	<table>
		<c:forEach var="list" items="${searchList}">
		<tbody>
		<tr>
			<td class="w-300">
			<h3 class="no-margin text-bold"><a href="javascript:select('${list.stockCode}');" class="hover-secondary d-inline-block">${list.stockCode}</a></h3>
			</td>
			<td class="w-400">
			<h3 class="no-margin text-bold"><a class="hover-secondary d-inline-block">${list.stockName}</a></h3>	
			</td>
		</tr>
		</tbody>
		</c:forEach>
	</table>
<script src="/stock/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">	
function select(code) {
			if(code !=0){
				document.search.keyword.value = code;
				$.ajax({
					type:"GET",
					data:"CompanyCode=" + code,
					url: '${pageContext.request.contextPath}/user/asking_stock',
					success:function(data){
						$('#asking').html(data);
					},
					error:function(){
						alert('잠시만 기다려주세요');
					}
				});
				
				$.ajax({
					type:"GET",
					data:"CompanyCode=" + code,
					url: '${pageContext.request.contextPath}/user/chart_stock',
					success:function(data){
						$('#chart_stock').html(data);
					},
					error:function(){
						alert('잠시만 기다려주세요');
					}
				});
				
				$.ajax({
					type:"GET",
					data:"CompanyCode=" + code,
					url: '${pageContext.request.contextPath}/user/inf_stock',
					success:function(data){
						$('#inf').html(data);
					},
					error:function(){
						alert('잠시만 기다려주세요');
					}
				});
				
				$.ajax({
					type:"GET",
					data:"CompanyCode=" + code + '&username=' + '${pageContext.request.userPrincipal.name}',
					url: '${pageContext.request.contextPath}/user/complete',
					success:function(data){
						$('#complete').html(data);
					},
					error:function(){
						alert('잠시만 기다려주세요');
					}
				});
			}
	 	 }
</script>
</body>
</html>