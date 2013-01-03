
<%@ page import="com.kelitech.sos.WorkPostPart" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'workPostPart.label', default: 'WorkPostPart')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-workPostPart" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-workPostPart" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list workPostPart">
			
				<g:if test="${workPostPartInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="workPostPart.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${workPostPartInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workPostPartInstance?.part}">
				<li class="fieldcontain">
					<span id="part-label" class="property-label"><g:message code="workPostPart.part.label" default="Part" /></span>
					
						<span class="property-value" aria-labelledby="part-label"><g:link controller="part" action="show" id="${workPostPartInstance?.part?.id}">${workPostPartInstance?.part?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${workPostPartInstance?.stationTool}">
				<li class="fieldcontain">
					<span id="stationTool-label" class="property-label"><g:message code="workPostPart.stationTool.label" default="Station Tool" /></span>
					
						<span class="property-value" aria-labelledby="stationTool-label"><g:fieldValue bean="${workPostPartInstance}" field="stationTool"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workPostPartInstance?.stockAlert}">
				<li class="fieldcontain">
					<span id="stockAlert-label" class="property-label"><g:message code="workPostPart.stockAlert.label" default="Stock Alert" /></span>
					
						<span class="property-value" aria-labelledby="stockAlert-label"><g:fieldValue bean="${workPostPartInstance}" field="stockAlert"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${workPostPartInstance?.id}" />
					<g:link class="edit" action="edit" id="${workPostPartInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
