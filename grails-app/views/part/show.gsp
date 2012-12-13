
<%@ page import="com.kelitech.sos.Part" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'part.label', default: 'Part')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-part" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-part" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list part">
			
				<g:if test="${partInstance?.applicableCarModel}">
				<li class="fieldcontain">
					<span id="applicableCarModel-label" class="property-label"><g:message code="part.applicableCarModel.label" default="Applicable Car Model" /></span>
					
						<span class="property-value" aria-labelledby="applicableCarModel-label"><g:fieldValue bean="${partInstance}" field="applicableCarModel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partInstance?.colorCode}">
				<li class="fieldcontain">
					<span id="colorCode-label" class="property-label"><g:message code="part.colorCode.label" default="Color Code" /></span>
					
						<span class="property-value" aria-labelledby="colorCode-label"><g:fieldValue bean="${partInstance}" field="colorCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partInstance?.partDescription}">
				<li class="fieldcontain">
					<span id="partDescription-label" class="property-label"><g:message code="part.partDescription.label" default="Part Description" /></span>
					
						<span class="property-value" aria-labelledby="partDescription-label"><g:fieldValue bean="${partInstance}" field="partDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partInstance?.partNumber}">
				<li class="fieldcontain">
					<span id="partNumber-label" class="property-label"><g:message code="part.partNumber.label" default="Part Number" /></span>
					
						<span class="property-value" aria-labelledby="partNumber-label"><g:fieldValue bean="${partInstance}" field="partNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partInstance?.quantity}">
				<li class="fieldcontain">
					<span id="quantity-label" class="property-label"><g:message code="part.quantity.label" default="Quantity" /></span>
					
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${partInstance}" field="quantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partInstance?.stationTool}">
				<li class="fieldcontain">
					<span id="stationTool-label" class="property-label"><g:message code="part.stationTool.label" default="Station Tool" /></span>
					
						<span class="property-value" aria-labelledby="stationTool-label"><g:fieldValue bean="${partInstance}" field="stationTool"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partInstance?.stockAlertLimit}">
				<li class="fieldcontain">
					<span id="stockAlertLimit-label" class="property-label"><g:message code="part.stockAlertLimit.label" default="Stock Alert Limit" /></span>
					
						<span class="property-value" aria-labelledby="stockAlertLimit-label"><g:fieldValue bean="${partInstance}" field="stockAlertLimit"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${partInstance?.id}" />
					<g:link class="edit" action="edit" id="${partInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
