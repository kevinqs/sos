<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
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
		<r:require modules="jquery182,dynatree,custom, jqgrid" /> 
		<r:layoutResources />
		<g:layoutHead/>
		
		<SCRIPT type="text/javascript">
		
		$(document).ready(function(){		
				// create page layout
				pageLayout = $('body').layout({
					scrollToBookmarkOnLoad:		false // handled by custom code so can 'unhide' section first
				,	defaults: {
					}
				,	north: {
						size:					"auto"
					,	spacing_open:			0
					,	closable:				false
					,	resizable:				false
					}
				,	west: {
						size:					250
					,	spacing_closed:			22
					,	togglerLength_closed:	140
					,	togglerAlign_closed:	"top"
					,	togglerContent_closed:	"C<BR>o<BR>n<BR>t<BR>e<BR>n<BR>t<BR>s"
					,	togglerTip_closed:		"Open & Pin Contents"
					,	sliderTip:				"Slide Open Contents"
					,	slideTrigger_open:		"mouseover"
					}
				});
			});
			
		  $(function(){
			    // Attach the dynatree widget to an existing <div id="tree"> element
			    // and pass the tree options as an argument to the dynatree() function:
			    $("#navTree").dynatree({
//			          autoCollapse: true,
			      minExpandLevel: 1,
//			          persist: true,
			      onPostInit: function(isReloading, isError) {
			        this.reactivate();
			      },
			      onActivate: function(node) {
			        // Use <a> href and target attributes to load the content:
			        if( node.data.href ){
			          // Open target
			          window.open(node.data.href, node.data.target);
			          // or open target in iframe
//			                $("[name=contentFrame]").attr("src", node.data.href);
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
		<div id="navigation" class="ui-widget-header">
			<span class="header-menu">
				<a href="index.cfm">HOME</a>
			</span>
			<span class="header-menu">
				<a href="demos.cfm">DEMOS</a>
			</span>
			<span class="header-menu">
				<a href="downloads.cfm">DOWNLOADS</a>
			</span>
			<span class="header-menu">
				<a href="documentation.cfm" class="current">DOCUMENTATION</a>
			</span>
			<span class="header-menu">
				<a href="tips.cfm">TIPS</a>
			</span>
			<span class="header-menu">
				<a href="plugin.cfm">PLUGIN</a>
			</span>
			<span class="header-menu">
				<a href="issues.cfm">ISSUES</a>
			</span>
			<span class="header-menu">
				<a target="_blank" href="http://groups.google.com/group/jquery-ui-layout">DISCUSSION</a>
			</span>
		</div>
	</div>
	<div class="ui-layout-center ui-widget ui-widget-content">
		<g:layoutBody/>
	</div>
	<div class="ui-layout-west">
	 	<div id="navTree"> 
		<ul>
        <li class="expanded folder">Search engines
        <ul>
          <li><a href="http://www.google.com" target="contentFrame">Google (target='contentFrame')</a>
          <li><a href="http://www.google.com" target="_self">Google (target='_self')</a>
          <li><a href="http://www.google.com" target="_top" title="This link replaces the current page">Google (target='_top')</a>
          <li><a href="http://www.bing.com" target="contentFrame">Bing</a>
          <li><a href="http://www.wolframalpha.com/" target="contentFrame">WolframAlpha</a>
        </ul>
        <li class="expanded folder">jQuery
        <ul>
          <li><a href="http://www.jquery.com/" target="contentFrame">jQuery</a>
          <li><a href="http://ui.jquery.com/" target="contentFrame">jQuery UI</a>
          <li><a href="http://api.jquery.com/" target="contentFrame">API browser</a>
          <li><a href="http://code.google.com/p/dynatree/" target="contentFrame">Dynatree</a>
        </ul>
        <li class="expanded folder">Misc
        <ul>
          <li><a href="sample-iframe-1.html" target="contentFrame">Welcome</a>
        </ul>
      	</ul>	 	
	 	</div>
	</div>
	
	<div class="footer" role="contentinfo"></div>
	<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	<g:javascript library="application"/>
	<r:layoutResources />
	</body>
</html>
