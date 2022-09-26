<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	body *{
		 font-family: 'Jua';
	}
</style>
</head>
<body>
<div  style="margin: 30px 30px;">
	<h3 class="alert alert-danger" style="width: 800px;">MyShop 목록</h3>
	<br>
	<h3 class="alert alert-danger">총 ${count} 개의 데이타가 있습니다</h3>
	<table class="table table-bordered" style="width: 800px;">
		<tr class="table-info">
			<th width="50">번호</th>
			<th width="300">상품명</th>
			<th width="60">색상</th>
			<th width="100">가격</th>
			<th width="150">입고일</th>
			<th width="200">등록일</th>			
		</tr>
		<c:if test="${count==0}">
			<tr>
				<td  colspan="6" align="center">
					<h3><b>등록된 상품이 없습니다</b></h3>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${count>0}">
			<c:forEach var="dto" items="${list}" varStatus="i">
			<tr>
					<td align="center">${i.count}</td>
					<td>
						<img src="res/image2/${dto.photo}.jpg"
						width="60" height="60" class="img-thumbnail">						
						<b>${dto.sangpum}</b>
						</a>
					</td>
					<td style="background-color:${dto.color}">
						${dto.color}					
					</td>
					<td align="right">
						<fmt:formatNumber value="${dto.price}" type="currency"/>
					</td>
					<td align="center">${dto.ipgoday}</td>
					<td>
						<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/>
						<br>
						<button type="button" class="btn btn-outline-info btn-sm">수정</button>
						
						<button type="button" class="btn btn-outline-danger btn-sm">삭제</button>
						
					</td>
				</tr>
			</c:forEach>
		</c:if>		
	</table>
</div>	
<hr>
<div class="ajaxlist">
</div>
<script type="text/javascript">
$.ajax({
	type:"get",
	url:"list",
	dataType:"json",
	success:function(res){
		var s="";
		$.each(res,function(idx,item){
		   	s+="<img src='res/image2/"+item.photo+".jpg' width=100>";
		});		
		$("div.ajaxlist").html(s);
	},
	statusCode: {
		404:function(){
			alert("json 파일을 찾을수 없어요!");
		},
		500:function(){
			alert("서버 오류..코드를 다시 한번 보세요!");
		}
	}
});
</script>
</body>
</html>

