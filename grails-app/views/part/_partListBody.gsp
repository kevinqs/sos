		<script type="text/javascript">
            /* when the page has finished loading.. execute the follow */
            $(document).ready(function () {
                jQuery("#part_list").jqGrid({
                  url:'jq_part_list',
                  editurl:'jq_edit_part',
                  datatype: "json",
                  width:758,
                  height:200,
                  altRows:true,
                  colNames:['<g:message code="part.partNumber.label"/>',
                            '<g:message code="part.partName.label"/>',
                            '<g:message code="part.colorCode.label"/>', 
                            '<g:message code="part.applicableCarModel.label"/>'],
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
                  multiselect: true,
                  edit : {
                	     addCaption: "Add Record",
                	     editCaption: "Edit Record",
                	     bSubmit: "Submit",
                	     bCancel: "Cancel",
                	     bClose: "Close",
                	     saveData: "Data has been changed! Save changes?",
                	     bYes : "Yes",
                	     bNo : "No",
                	     bExit : "Cancel"
                    	 }                  
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
			<div class="nav" role="navigation">
				<ul>
				</ul>
			</div>
			<div>
	            <div id='message' class="message" style="display:none;"></div>
    	        <!-- table tag will hold our grid -->
        	    <table id="part_list"></table>
            	<!-- pager will hold our paginator -->
            	<div id="part_list_pager"></div>
			</div>
