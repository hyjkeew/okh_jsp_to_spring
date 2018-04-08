<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<html>
<title>layouts-tiles</title>

<link rel="stylesheet" type="text/css"  
	href="<%=request.getContextPath() %>/css/style.css"/>
<link rel="stylesheet" type="text/css"  
	href="<%=request.getContextPath() %>/css/_main.css?ver=2.03"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/_totalbbs.css?ver=1.26">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/_techbbs.css?ver=1.67">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/custom.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
	
</head>
<body>


	<div id="menu">
		<tiles:insertAttribute name="left_menu"/>
	</div>
	
		<tiles:insertAttribute name="main"/>		
	

     
</body>
</html>
