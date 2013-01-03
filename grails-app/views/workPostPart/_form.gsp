<%@ page import="com.kelitech.sos.WorkPostPart" %>



<div class="fieldcontain ${hasErrors(bean: workPostPartInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="workPostPart.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" value="${workPostPartInstance.amount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: workPostPartInstance, field: 'part', 'error')} required">
	<label for="part">
		<g:message code="workPostPart.part.label" default="Part" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="part" name="part.id" from="${com.kelitech.sos.Part.list()}" optionKey="id" required="" value="${workPostPartInstance?.part?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workPostPartInstance, field: 'stationTool', 'error')} ">
	<label for="stationTool">
		<g:message code="workPostPart.stationTool.label" default="Station Tool" />
		
	</label>
	<g:textField name="stationTool" value="${workPostPartInstance?.stationTool}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workPostPartInstance, field: 'stockAlert', 'error')} required">
	<label for="stockAlert">
		<g:message code="workPostPart.stockAlert.label" default="Stock Alert" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="stockAlert" type="number" value="${workPostPartInstance.stockAlert}" required=""/>
</div>

