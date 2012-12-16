
<%@ page import="com.kelitech.sos.Part" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'part.label', default: 'Part')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
            <script type="text/javascript">
            /* when the page has finished loading.. execute the follow */
            $(document).ready(function () {
                // set on click events for non toolbar buttons
                $("#btnAdd").click(function(){
                  $("#part_list").jqGrid("editGridRow","new",
                     {addCaption:'Create New Part',
                     afterSubmit:afterSubmitEvent,
                     closeAfterEdit:true,
                     savekey:[true,13]});
                });

                $("#btnEdit").click(function(){
                    var gr = $("#part_list").jqGrid('getGridParam','selrow');
                    if( gr != null )
                      $("#part_list").jqGrid('editGridRow',gr,
                      {closeAfterEdit:true,
                       afterSubmit:afterSubmitEvent
                      });
                    else
                      alert("Please Select Row");
                 });

                 $("#btnDelete").click(function(){
                   var gr = $("#part_list").jqGrid('getGridParam','selrow');
                   if( gr != null )
                     $("#part_list").jqGrid('delGridRow',gr,
                      {afterSubmit:afterSubmitEvent});
                   else
                     alert("Please Select Row to delete!");
                 });
                
                jQuery("#part_list").jqGrid({
                  url:'jq_part_list',
                  editurl:'jq_edit_part',
                  datatype: "json",
                  width:958,
                  height:100,
                  altRows:true,
                  autowidth:true,
                  colNames:['Part Number','Part Description','Color Code', '<g:message code="default.link.skip.label" default="Applicable Car Model"/>'],
                  colModel:[
                    {name:'partNumber', editable:true, editOptions:{size:35}, editrules:{required:true}},
                    {name:'partDescription', editable:true, editOptions:{size:50}},
                    {name:'colorCode', editable:true, editOptions:{size:10}},
                    {name:'applicableCarModel', editable:true, editOptions:{size:35}}
                  ],
                  pager: jQuery('#part_list_pager'),
                  viewrecords: true,
                  gridview: true,
                  caption:"Part List",
                  multiselect: true
                });

                
                jQuery("#part_list").navGrid('#part_list_pager',
                        {add:true,edit:true,del:true,search:false,refresh:true},      // which buttons to show?
                        {closeAfterEdit:true,
                         afterSubmit:afterSubmitEvent
                        },                                   // edit options
                        {addCaption:'Create New Part',
                         afterSubmit:afterSubmitEvent,
                         savekey:[true,13]},            // add options
                        {afterSubmit:afterSubmitEvent}  // delete options
                    );

//                $("#part_list").jqGrid('filterToolbar',{autosearch:true});
            });

            function afterSubmitEvent(response, postdata) {
                var success = true;
                console.log ('here')
                var json = eval('(' + response.responseText + ')');
                var message = json.message;

                if(json.state == 'FAIL') {
                    success = false;
                } else {
                  $('#message').html(message);
                  $('#message').show().fadeOut(10000);  // 10 second fade
                }

                var new_id = json.id
                return [success,message,new_id];
            }
            
            </script>
	</head>
	<body>
		<div class="ui-layout-west">
		 	<div id="navTree"> 
		 		<g:render template="/layouts/navTree"/>
		 	</div>
		</div>
		<div class="ui-layout-center">
	
			<a href="#list-part" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
			<div class="nav" role="navigation">
				<ul>
					<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
			<div>
	            <div id='message' class="message" style="display:none;"></div>
    	        <!-- table tag will hold our grid -->
        	    <table id="part_list"></table>
            	<!-- pager will hold our paginator -->
            	<div id="part_list_pager"></div>
			</div>
		</div>
	</body>
</html>
