
<%@ page import="com.kelitech.sos.WorkPostBom" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'workPostBom.label', default: 'WorkPostBom')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-workPostBom" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-workPostBom" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list workPostBom">
			
				<g:if test="${workPostBomInstance?.approval}">
				<li class="fieldcontain">
					<span id="approval-label" class="property-label"><g:message code="workPostBom.approval.label" default="Approval" /></span>
					
						<span class="property-value" aria-labelledby="approval-label"><g:fieldValue bean="${workPostBomInstance}" field="approval"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workPostBomInstance?.auditor}">
				<li class="fieldcontain">
					<span id="auditor-label" class="property-label"><g:message code="workPostBom.auditor.label" default="Auditor" /></span>
					
						<span class="property-value" aria-labelledby="auditor-label"><g:fieldValue bean="${workPostBomInstance}" field="auditor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workPostBomInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="workPostBom.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label"><g:fieldValue bean="${workPostBomInstance}" field="author"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workPostBomInstance?.effectiveDate}">
				<li class="fieldcontain">
					<span id="effectiveDate-label" class="property-label"><g:message code="workPostBom.effectiveDate.label" default="Effective Date" /></span>
					
						<span class="property-value" aria-labelledby="effectiveDate-label"><g:formatDate date="${workPostBomInstance?.effectiveDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${workPostBomInstance?.mainParts}">
				<li class="fieldcontain">
					<span id="mainParts-label" class="property-label"><g:message code="workPostBom.mainParts.label" default="Main Parts" /></span>
					
						<g:each in="${workPostBomInstance.mainParts}" var="m">
						<span class="property-value" aria-labelledby="mainParts-label"><g:link controller="workPostPart" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${workPostBomInstance?.id}" />
					<g:link class="edit" action="edit" id="${workPostBomInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
