modules = {
    application {
        resource url:'js/application.js'
    }
	
	jquery18 {
		resource url:'js/jquery/jquery-1.8.2.js',  disposition: 'head'
		resource url:'js/jquery/jquery-ui-1.9.1.custom.js',  disposition: 'head'
		resource url:'js/jquery/jquery.cookies.2.2.0.min.js'
		resource url:'css/jqgrid/jquery-ui-1.9.2.custom.css'
	}
	
	jqgrid {
		dependsOn 'jquery18'
		resource url:'css/jqgrid/ui.jqgrid.css'
		resource url:'css/jqgrid/custom.css'
		resource url:'js/jqgrid/i18n/grid.locale-en.js'
		resource url:'js/jqgrid/jquery.jqGrid.min.js'
		resource url:'js/jqgrid/jquery.jqGrid.src.js'
		resource url:'js/jqgrid/jquery.json-2.3.js'
		resource url: 'js/jqgrid/grid.postext.js'

	}
	
	dynatree {
		dependsOn 'jquery18'
		resource url:'css/dynatree/ui.dynatree.css'
		resource url:'js/dynatree/jquery.dynatree.js'
		
	}
	
	bootstrap {
		dependsOn 'jquery18'
		resource url: 'css/bootstrap/bootstrap.css'
		resource url: 'css/bootstrap/bootstrap-responsive.css'
		resource url: 'js/bootstrap/bootstrap.js'
	}
	
	custom {
		dependsOn 'jquery18'
		resource url:'js/jquery-layout/jquery.layout-latest.js'
		resource url:'css/custom/documentation.css'
		resource url:'css/custom/global.css'
		resource url:'css/custom/jquery-layout-default.css'
	}
	
	stacktrace {
		resource url: 'js/stacktrace/stacktrace.js'
	}
}