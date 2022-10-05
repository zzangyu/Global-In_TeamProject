<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="loginID" value="${sessionScope.loginID }"/>
		
			<c:if test="${loginID == null }">
				<script type="text/javascript">
				alert('로그인을 하세요.');
				location.href = 'login.jsp';
				</script>
			</c:if>
			<c:if test="${num == 0 }">
				<script type="text/javascript">
				alert('유효하지 않은 글 입니다.');
				location.href = './boardList.do';
				</script>
			</c:if>
			
			<c:choose>
			<c:when test="${!loginID eq comment.userID }">
				<script type="text/javascript">
				alert('권한이 없습니다.');
				history.back();
				</script>
			</c:when>
			<c:otherwise>
				<c:choose>
				<c:when test="${commentText eq null }">
					<script type="text/javascript">
						alert('입력이 안된 사항이 있습니다');
						history.back();
					</script>
				</c:when>
				<c:otherwise>
					<c:choose>
					<c:when test="${result == -1 }">
						<script type="text/javascript">
							alert('글수정에 실패했습니다');
							history.back();
						</script>
					</c:when>
					<c:otherwise>
						<script type="text/javascript">
							window.close();
							window.opener.location.href= 'cityPlan.do?cmd=boardContent&num='+${num}+'&pageNum='+${pageNum };
						</script>
					</c:otherwise>
					</c:choose>
				</c:otherwise>
				</c:choose>
			</c:otherwise>
			</c:choose>

</body>
</html>