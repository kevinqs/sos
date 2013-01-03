
<%@ page import="com.kelitech.sos.WorkPostPart" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'workPostPart.label', default: 'WorkPostPart')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-workPostPart" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-workPostPart" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="amount" title="${message(code: 'workPostPart.amount.label', default: 'Amount')}" />
					
						<th><g:message code="workPostPart.part.label" default="Part" /></th>
					
						<g:sortableColumn property="stationTool" title="${message(code: 'workPostPart.stationTool.label', default: 'Station Tool')}" />
					
						<g:sortableColumn property="stockAlert" title="${message(code: 'workPostPart.stockAlert.label', default: 'Stock Alert')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${workPostPartInstanceList}" status="i" var="workPostPartInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${workPostPartInstance.id}">${fieldValue(bean: workPostPartInstance, field: "amount")}</g:link></td>
					
						<td>${fieldValue(bean: workPostPartInstance, field: "part")}</td>
					
						<td>${fieldValue(bean: workPostPartInstance, field: "stationTool")}</td>
					
						<td>${fieldValue(bean: workPostPartInstance, field: "stockAlert")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${workPostPartInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
