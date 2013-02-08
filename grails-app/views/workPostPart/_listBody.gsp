		<script type="text/javascript">
            /* when the page has finished loading.. execute the follow */
 //           $(document).ready(function () {
                // set on click events for non toolbar buttons
                $("#btnAdd").click(function(){
                  $("#work_post_part_list").jqGrid("editGridRow","new",
                     {addCaption:'Create New Part',
                     afterSubmit:afterSubmitEvent,
                     closeAfterEdit:true,
                     savekey:[true,13]});
                });

                $("#btnEdit").click(function(){
                    var gr = $("#work_post_part_list").jqGrid('getGridParam','selrow');
                    if( gr != null )
                      $("#part_list").jqGrid('editGridRow',gr,
                      {closeAfterEdit:true,
                       afterSubmit:afterSubmitEvent
                      });
                    else
                      alert("Please Select Row");
                 });

                 $("#btnDelete").click(function(){
                   var gr = $("#work_post_part_list").jqGrid('getGridParam','selrow');
                   if( gr != null )
                     $("#part_list").jqGrid('delGridRow',gr,
                      {afterSubmit:afterSubmitEvent});
                   else
                     alert("Please Select Row to delete!");
                 });
                jQuery("#work_post_part_list").jqGrid({
                  url:'/sos/workPostPart/jq_part_list',
                  editurl:'/sos/workPostPart/jq_edit_workPostpart',
                  datatype: "json",
                  width:758,
                  height:200,
                  altRows:true,
                  colNames:['<g:message code="part.id.label"/>',
                            '<g:message code="workPostPart.id.label"/>',
                            '<g:message code="part.partNumber.label"/>',
                            '<g:message code="part.colorCode.label"/>',
                            '<g:message code="part.partName.label"/>',
                            '<g:message code="workPostPart.amount.label"/>',
                            '<g:message code="workPostPart.stationTool.label"/>',
                            '<g:message code="workPostPart.stockAlert.label"/>',
                            '<g:message code="part.applicableCarModel.label"/>'],
                  colModel:[
                            {name:'part.id', editable:true, hidden:true, edittype: 'select',
                                editrules: {required:true, edithidden:true},
                                editoptions :
                             	{
                            	 	dataUrl:'/sos/workPostPart/part_list_as_options',
                            	 	buildSelect: function (data) {
                                	 				
                            	 					var retValue = $.parseJSON(data);
                            	        			//var response = $.parseJSON(retValue.d);
                            	        			var s= '<select role="select" class="FormElement" id="part.id" name="part.id">'
                            	        			if (retValue && retValue.length) {
                            	        				for (var i = 0, l = retValue.length; i < l; i++) {
                            	        					s += '<option value="' + retValue[i]["id"] + '" title="' + retValue[i]["partDescription"] + '">' + retValue[i]["partNumber"] + '</option>';
                                	        			}
                                	        		}
                            	        			return s + "</select>";
                                    			}

                             	}
                            },
		                    {name:'id', editable:false, width:30},
		                    {name:'part.partNumber', editable:false,width:50},
		                    {name:'part.colorCode', editable:false, width:30},
		                    {name:'part.partDescription', editable:false, width:60},
		                    {name:'amount', editable:true, editOptions:{size:35},width:30},
		                    {name:'stationTool', editable:true, width:50},
		                    {name:'stockAlert', editable:true, width:30},
		                    {name:'part.applicableCarModel', editable:false,width:40}
		                  ],
                  pager: jQuery('#work_post_part_list_pager'),
                  viewrecords: true,
                  gridview: true,
                  caption:"Part List",
                  multiselect: true
                });

                
                jQuery("#work_post_part_list").navGrid('#work_post_part_list_pager',
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
//            });

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
			<div class="nav" role="navigation">
				<ul>
				</ul>
			</div>
			<div>
	            <div id='message' class="message" style="display:none;"></div>
    	        <!-- table tag will hold our grid -->
        	    <table id="work_post_part_list"></table>
            	<!-- pager will hold our paginator -->
            	<div id="work_post_part_list_pager"></div>
			</div>
