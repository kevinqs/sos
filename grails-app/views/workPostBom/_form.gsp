<%@ page import="com.kelitech.sos.WorkPostBom" %>



<div class="fieldcontain ${hasErrors(bean: workPostBomInstance, field: 'accessories', 'error')} ">
	<label for="accessories">
		<g:message code="workPostBom.accessories.label" default="Accessories" />
		
	</label>
	<g:select name="accessories" from="${com.kelitech.sos.Accessory.list()}" multiple="multiple" optionKey="id" size="5" value="${workPostBomInstance?.accessories*.id}" class="many-to-many"/>
</div>

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

<div class="fieldcontain ${hasErrors(bean: workPostBomInstance, field: 'fixtures', 'error')} ">
	<label for="fixtures">
		<g:message code="workPostBom.fixtures.label" default="Fixtures" />
		
	</label>
	<g:select name="fixtures" from="${com.kelitech.sos.Fixture.list()}" multiple="multiple" optionKey="id" size="5" value="${workPostBomInstance?.fixtures*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workPostBomInstance, field: 'mainParts', 'error')} ">
	<label for="mainParts">
		<g:message code="workPostBom.mainParts.label" default="Main Parts" />
		
	</label>
	<g:select name="mainParts" from="${com.kelitech.sos.WorkPostPart.list()}" multiple="multiple" optionKey="id" size="5" value="${workPostBomInstance?.mainParts*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workPostBomInstance, field: 'ppes', 'error')} ">
	<label for="ppes">
		<g:message code="workPostBom.ppes.label" default="Ppes" />
		
	</label>
	<g:select name="ppes" from="${com.kelitech.sos.PPE.list()}" multiple="multiple" optionKey="id" size="5" value="${workPostBomInstance?.ppes*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workPostBomInstance, field: 'serialNumber', 'error')} ">
	<label for="serialNumber">
		<g:message code="workPostBom.serialNumber.label" default="Serial Number" />
		
	</label>
	<g:textField name="serialNumber" value="${workPostBomInstance?.serialNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workPostBomInstance, field: 'tools', 'error')} ">
	<label for="tools">
		<g:message code="workPostBom.tools.label" default="Tools" />
		
	</label>
	<g:select name="tools" from="${com.kelitech.sos.Tool.list()}" multiple="multiple" optionKey="id" size="5" value="${workPostBomInstance?.tools*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workPostBomInstance, field: 'workPost', 'error')} ">
	<label for="workPost">
		<g:message code="workPostBom.workPost.label" default="Work Post" />
		
	</label>
	<g:textField name="workPost" value="${workPostBomInstance?.workPost}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workPostBomInstance, field: 'workPostName', 'error')} ">
	<label for="workPostName">
		<g:message code="workPostBom.workPostName.label" default="Work Post Name" />
		
	</label>
	<g:textField name="workPostName" value="${workPostBomInstance?.workPostName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workPostBomInstance, field: 'workSection', 'error')} ">
	<label for="workSection">
		<g:message code="workPostBom.workSection.label" default="Work Section" />
		
	</label>
	<g:textField name="workSection" value="${workPostBomInstance?.workSection}"/>
</div>

