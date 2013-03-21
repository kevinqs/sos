<%@ page import="com.kelitech.sos.WorkPostBom" %>



<div class="fieldcontain ${hasErrors(bean: workPostBomInstance, field: 'approval', 'error')} ">
	<label for="approval">
		<g:message code="workPostBom.approval.label" default="Approval" />
		
	</label>
	<g:textField name="approval" value="${workPostBomInstance?.approval}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workPostBomInstance, field: 'auditor', 'error')} ">
	<label for="auditor">
		<g:message code="workPostBom.auditor.label" default="Auditor" />
		
	</label>
	<g:textField name="auditor" value="${workPostBomInstance?.auditor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workPostBomInstance, field: 'author', 'error')} ">
	<label for="author">
		<g:message code="workPostBom.author.label" default="Author" />
		
	</label>
	<g:textField name="author" value="${workPostBomInstance?.author}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workPostBomInstance, field: 'effectiveDate', 'error')} required">
	<label for="effectiveDate">
		<g:message code="workPostBom.effectiveDate.label" default="Effective Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="effectiveDate" precision="day"  value="${workPostBomInstance?.effectiveDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: workPostBomInstance, field: 'mainParts', 'error')} ">
	<label for="mainParts">
		<g:message code="workPostBom.mainParts.label" default="Main Parts" />
		
	</label>
	<g:select name="mainParts" from="${com.kelitech.sos.WorkPostPart.list()}" multiple="multiple" optionKey="id" size="5" value="${workPostBomInstance?.mainParts*.id}" class="many-to-many"/>
</div>

