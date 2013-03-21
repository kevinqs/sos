
<%@ page import="com.kelitech.sos.WorkPostBom" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'workPostBom.label', default: 'WorkPostBom')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-workPostBom" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-workPostBom" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="approval" title="${message(code: 'workPostBom.approval.label', default: 'Approval')}" />
					
						<g:sortableColumn property="auditor" title="${message(code: 'workPostBom.auditor.label', default: 'Auditor')}" />
					
						<g:sortableColumn property="author" title="${message(code: 'workPostBom.author.label', default: 'Author')}" />
					
						<g:sortableColumn property="effectiveDate" title="${message(code: 'workPostBom.effectiveDate.label', default: 'Effective Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${workPostBomInstanceList}" status="i" var="workPostBomInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${workPostBomInstance.id}">${fieldValue(bean: workPostBomInstance, field: "approval")}</g:link></td>
					
						<td>${fieldValue(bean: workPostBomInstance, field: "auditor")}</td>
					
						<td>${fieldValue(bean: workPostBomInstance, field: "author")}</td>
					
						<td><g:formatDate date="${workPostBomInstance.effectiveDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${workPostBomInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
