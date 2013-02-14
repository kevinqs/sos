		<script type="text/javascript">
            /* when the page has finished loading.. execute the follow */
            $(document).ready(function () {
                // set on click events for non toolbar buttons
                $("#btnAdd").click(function(){
                  $("#tool_list").jqGrid("editGridRow","new",
                     {addCaption:'Create New Tool',
                     afterSubmit:afterSubmitEvent,
                     closeAfterEdit:true,
                     savekey:[true,13]});
                });

                $("#btnEdit").click(function(){
                    var gr = $("#tool_list").jqGrid('getGridParam','selrow');
                    if( gr != null )
                      $("#tool_list").jqGrid('editGridRow',gr,
                      {closeAfterEdit:true,
                       afterSubmit:afterSubmitEvent
                      });
                    else
                      alert("Please Select Row");
                 });

                 $("#btnDelete").click(function(){
                   var gr = $("#tool_list").jqGrid('getGridParam','selrow');
                   if( gr != null )
                     $("#tool_list").jqGrid('delGridRow',gr,
                      {afterSubmit:afterSubmitEvent});
                   else
                     alert("Please Select Row to delete!");
                 });
                
                jQuery("#tool_list").jqGrid({
                  url:'/sos/tool/jq_tool_list',
                  editurl:'/sos/tool/jq_edit_tool',
                  datatype: "json",
                  width:758,
                  height:200,
                  altRows:true,
                  colNames:['<g:message code="workPostPart.id.label"/>',
                            '<g:message code="tool.name.label"/>',
                            '<g:message code="tool.sku.label"/>',
                            '<g:message code="tool.model.label"/>', 
                            '<g:message code="tool.parameter.label"/>', 
                            '<g:message code="tool.consumption.label"/>'],
                  colModel:[
                    {name:'id', editable:false},
                    {name:'sku', editable:true, editOptions:{size:50}},
                    {name:'name', editable:true, editOptions:{size:50}},
                    {name:'model', editable:true, editOptions:{size:50}},
                    {name:'parameter', editable:true, editOptions:{size:50}},
                    {name:'consumption', editable:true, editOptions:{size:25}}
                  ],
                  pager: jQuery('#tool_list_pager'),
                  viewrecords: true,
                  gridview: true,
                  caption:"Tool List",
                  multiselect: true
                });

                
                jQuery("#tool_list").navGrid('#tool_list_pager',
                        {add:true,edit:true,del:true,search:false,refresh:true},      // which buttons to show?
                        {closeAfterEdit:true,
                         afterSubmit:afterSubmitEvent
                        },                                   // edit options
                        {addCaption:'Create New Tool',
                         afterSubmit:afterSubmitEvent,
                         savekey:[true,13]},            // add options
                        {afterSubmit:afterSubmitEvent}  // delete options
                    );

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
                  $('#message').show().fadeOut(1000);  // 10 second fade
                }

                var new_id = json.id
                return [success,message,new_id];
            }
            
            </script>
			<div class="nav" role="navigation">
				<ul>
				</ul>
			</div>
			<div>
	            <div id='message' class="message" style="display:none;"></div>
    	        <!-- table tag will hold our grid -->
        	    <table id="tool_list"></table>
            	<!-- pager will hold our paginator -->
            	<div id="tool_list_pager"></div>
			</div>
