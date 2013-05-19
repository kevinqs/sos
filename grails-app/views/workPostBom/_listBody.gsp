        <script type="text/javascript">
            /* when the page has finished loading.. execute the follow */
 //           $(document).ready(function () {

               jQuery("#work_post_bom_list").jqGrid({
                  url:'/sos/workPostBom/jq_bom_list',
                  
                  //editurl:'/sos/workPostBom/jq_edit_workPostBom',
                  datatype: "json",
                  autowidth:true,
                  height:200,
                  altRows:true,
                  colNames:['<g:message code="workPostBom.id.label"/>',
                            '<g:message code="workPostBom.workPostName.label"/>',
                            '<g:message code="workPostBom.workSection.label"/>',
                            '<g:message code="workPostBom.workPost.label"/>',
                            '<g:message code="workPostBom.serialNum.label"/>',
                            '<g:message code="workPostBom.author.label"/>',
                            '<g:message code="workPostBom.auditor.label"/>',
                            '<g:message code="workPostBom.approver.label"/>',
                            '<g:message code="workPostBom.effectiveDate.label"/>'],
                  colModel:[
                            {name:'id', editable:false, width:30},
                            {name:'workPostName', editable:false,width:50},
                            {name:'workSection', editable:false, width:30},
                            {name:'workPost', editable:false, width:60},
                            {name:'serialNumber', editable:false,width:30},
                            {name:'author', editable:false, width:50},
                            {name:'auditor', editable:false, width:30},
                            {name:'approver', editable:false, width:30},
                            {name:'effectiveDate', editable:false,width:40}
                          ],
                  pager: jQuery('#work_post_bom_list_pager'),
                  viewrecords: true,
                  gridview: true,
                  caption:"Work Post Bom List",
                  multiselect: true
                });

                
                jQuery("#work_post_bom_list").navGrid('#work_post_bom_list_pager',
                        
                        {add:true,
                         edit:true,
                         del:true,
                         search:false,
                         refresh:true,
                         editfunc: function() {$("#center").load("/sos/workPostBom/workPostBomDetails");},
                         addfunc: function() {jQuery("#center").load("/sos/workPostBom/workPostBomDetails", {wpbId:"new"});}
                
                         },      // which buttons to show?
                        {closeAfterEdit:true,
                         afterSubmit:afterSubmitEvent
                        },                                   // edit options
                        {addCaption:'Create New BOM',
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
            <div id="listContainer">
                <div id='message' class="message" style="display:none;"></div>
                <!-- table tag will hold our grid -->
                <table id="work_post_bom_list"></table>
                <!-- pager will hold our paginator -->
                <div id="work_post_bom_list_pager"></div>
            </div>
