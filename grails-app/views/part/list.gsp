
<%@ page import="com.kelitech.sos.Part" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'part.label', default: 'Part')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="ui-layout-west">
		 	<div id="navTree"> 
		 	</div>
		</div>
		<div id="center" class="ui-layout-center">
			<g:render template="/part/partListBody"/>
		</div>
	</body>
</html>
