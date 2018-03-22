<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>景点</title>
	<style type="text/css">
		.header-banner{
			background-size: 0 !important;
		}
	</style>
</head>
<body class="bg">
			<!--header-->
			<jsp:include page="/WEB-INF/common/header.jsp"></jsp:include>
			<!--header-->
		<div class="content">
		<!--gallery-->
	<div class="properties">		
		<div class="container">
			<h2>美丽婺源</h2>
			<div class="properties-grids">
				<c:forEach var="scenic" items="${scenics}">
					<div class="col-md-4 propertie-grids view view-fourth">
						<a class="example-image-link" href="${ctx}/scenic/jump/scenicInfo?id=${scenic.id}">
							<img src="${ctx}${scenic.filepath !=null and scenic.filepath !=""?scenic.filepath:'/resources/showtemp/images/g4.jpg'}" class="img-responsive" alt=""/>
							<div class="mask">
								<h5>${scenic.title}</h5>
							</div>
						</a>
					</div>
				</c:forEach>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>	
	<!--portfolio-->
	</div>
			<!--footer-->
			<jsp:include page="/WEB-INF/common/footer.jsp"></jsp:include>
			<!--footer-->

</body>
</html>
