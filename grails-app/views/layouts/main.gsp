<!DOCTYPE html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:javascript library="application"/>
		<r:require modules="jquery18, dynatree, custom, jqgrid" /> 
		<r:layoutResources />
		<nav:resources/>
		<g:layoutHead/>
		
		<SCRIPT type="text/javascript">
		
			$(document).ready(function(){		
					// create page layout
					pageLayout = $('body').layout({
						center__childOptions:	{
							//this empty propery is needed to support nested layout.
						},
						scrollToBookmarkOnLoad:		false // handled by custom code so can 'unhide' section first
					,	defaults: {
						}
					,	north: {
							size:					"auto"
						,	spacing_open:			0
						,	closable:				false
						,	resizable:				false
						}
					});

			    $("#navTree").dynatree({
			      //autoCollapse: true,
			      minExpandLevel: 1,
			      children: ${navigationTree},
			      //persist: true,
			      autoFocus:true,
			      onPostInit: function(isReloading, isError) {
			        this.reactivate();
			      },
			      onActivate: function(node) {
			        if( node.data.href ){
			        	$("#center").load(node.data.href);				        
			        }
			      }
			    });
				
			});
			
		
		</SCRIPT>		
	</head>
	<body>
	<div class="ui-layout-north">
		<!-- DIV id="logo" class="ui-widget-header">jQuery UI Layout Plug-in</DIV-->
		<div id="grailsLogo" role="banner" class="ui-widget-header">
			<a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a>
		</DIV>
		 <g:render template="/layouts/globalNav"/>
	</div>
	<div class="ui-layout-center ui-widget ui-widget-content" >
		<g:layoutBody/>
	</div>
	
	<div class="footer" role="contentinfo"></div>
	<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	<g:javascript library="application"/>
	<r:layoutResources />
	</body>
</html>
