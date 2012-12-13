<%@ page import="com.kelitech.sos.Part" %>



<div class="fieldcontain ${hasErrors(bean: partInstance, field: 'applicableCarModel', 'error')} ">
	<label for="applicableCarModel">
		<g:message code="part.applicableCarModel.label" default="Applicable Car Model" />
		
	</label>
	<g:textField name="applicableCarModel" value="${partInstance?.applicableCarModel}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partInstance, field: 'colorCode', 'error')} ">
	<label for="colorCode">
		<g:message code="part.colorCode.label" default="Color Code" />
		
	</label>
	<g:textField name="colorCode" value="${partInstance?.colorCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partInstance, field: 'partDescription', 'error')} ">
	<label for="partDescription">
		<g:message code="part.partDescription.label" default="Part Description" />
		
	</label>
	<g:textField name="partDescription" value="${partInstance?.partDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partInstance, field: 'partNumber', 'error')} ">
	<label for="partNumber">
		<g:message code="part.partNumber.label" default="Part Number" />
		
	</label>
	<g:textField name="partNumber" value="${partInstance?.partNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="part.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantity" type="number" value="${partInstance.quantity}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: partInstance, field: 'stationTool', 'error')} ">
	<label for="stationTool">
		<g:message code="part.stationTool.label" default="Station Tool" />
		
	</label>
	<g:textField name="stationTool" value="${partInstance?.stationTool}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partInstance, field: 'stockAlertLimit', 'error')} required">
	<label for="stockAlertLimit">
		<g:message code="part.stockAlertLimit.label" default="Stock Alert Limit" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="stockAlertLimit" type="number" value="${partInstance.stockAlertLimit}" required=""/>
</div>

