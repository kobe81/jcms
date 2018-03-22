<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body class="bg">
			<!--header-->
			<jsp:include page="/WEB-INF/common/header.jsp"></jsp:include>
			<!--header-->
	<div class="content">
		<div class="typography">
			<!-- container-wrap -->
			<div class="container" style="background: #fff;">
				<h2 class="short" style="padding: 10px;margin-top: 15px;">${info.title}</h2>
				<div style="text-align: center;margin-top: 8px;border-bottom: 1px solid #a1a1a1;">发布日期： <fmt:formatDate value="${info.creatTime}" pattern="yyyy-MM-dd HH:mm:ss"/>  编辑：${info.author} 来源：${info.source}</div>
				<div class="grid_3 grid_5" style="min-height: 800px;">
					<c:if test="${info.type !=null and info.type!='' and info.type=='20'}">
						<div style="text-align: center;">
							<img src="${ctx}${info.filepath}">
						</div>
					</c:if>
					<div>
						${info.content}
					</div>
				</div>
			</div>
			<!-- //container-wrap -->
	</div>
	<!-- //typography -->
	</div>

			<!--footer-->
			<jsp:include page="/WEB-INF/common/footer.jsp"></jsp:include>
			<!--footer-->
</body>
</html>
