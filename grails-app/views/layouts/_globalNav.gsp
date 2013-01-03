
<g:if test="${selectedMenu == 'parts'}">
	<g:set var="sosSelected" value="current" scope="page" />
</g:if>
<g:elseif test="${homeSelected == 'current'}">
</g:elseif>

<div id="navigation" class="ui-widget-header">
	<span id="home" class="header-menu">
		<a href="/sos" class="${homeSelected}">HOME</a>
	</span>
	<span id="sos" class="header-menu">
		<a href="/sos/part/index" class="${sosSelected}"><g:message code="global.menu.sos" default="SOS"/></a>
	</span>
</div>
