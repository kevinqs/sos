function initWorkPostPartList(title, colNames) {
    jQuery("#work_post_part_list").jqGrid({
        url:'/sos/workPostPart/jq_part_list',
        editurl:'/sos/workPostPart/jq_edit_workPostpart',
        datatype: "json",
        width:600,
        height:300,
        altRows:true,
        colNames:colNames,
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
                  {name:'part.partNumber', editable:false,width:30},
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
        caption: title,
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
}


function initFixtureList(title, colNames) {
    jQuery("#fixture_list").jqGrid({
        url:'/sos/fixture/jq_fixture_list',
        editurl:'/sos/fixture/jq_edit_fixture',
        datatype: "json",
        width:520,
        height:200,
        altRows:true,
        colNames:colNames,
        colModel:[{name:'id', editable:false, width:30},
                  {name:'name', editable:true, editOptions:{size:50}},
                  {name:'model', editable:true, editOptions:{size:50}},
                  {name:'application', editable:true, editOptions:{size:50}}
                ],
        pager: jQuery('#fixture_list_pager'),
        viewrecords: true,
        gridview: true,
        caption: title,
        multiselect: true
      });

    jQuery("#fixture_list").navGrid('#fixture_list_pager',
            {add:true,edit:true,del:true,search:false,refresh:true},      // which buttons to show?
            {closeAfterEdit:true,
             afterSubmit:afterSubmitEvent
            },                                   // edit options
            {addCaption:'Create New Fixture',
             afterSubmit:afterSubmitEvent,
             savekey:[true,13]},            // add options
            {afterSubmit:afterSubmitEvent}  // delete options
     );
}

function initToolList(title, colNames) {
    jQuery("#tool_list").jqGrid({
        url:'/sos/tool/jq_tool_list',
        editurl:'/sos/tool/jq_edit_tool',
        datatype: "json",
        width:520,
        height:200,
        altRows:true,
        colNames:colNames,
        colModel:[
          {name:'id', editable:false, width:30},
          {name:'sku', editable:true, editOptions:{size:20}},
          {name:'name', editable:true, editOptions:{size:50}},
          {name:'model', editable:true, editOptions:{size:50}},
          {name:'parameter', editable:true, editOptions:{size:50}},
          {name:'consumption', editable:true, editOptions:{size:25}}
        ],
        pager: jQuery('#tool_list_pager'),
        viewrecords: true,
        gridview: true,
        caption:title,
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
}

function initAccessoryList(title, colNames) {
    jQuery("#accessory_list").jqGrid({
        url:'/sos/accessory/jq_accessory_list',
        editurl:'/sos/accessory/jq_edit_accessory',
        datatype: "json",
        width:600,
        height:200,
        altRows:true,
        colNames:colNames,
        colModel:[
          {name:'id', editable:false, width:30},
          {name:'partNumber', editable:true, editOptions:{size:20}},
          {name:'partName', editable:true, editOptions:{size:50}},
          {name:'stationTool', editable:true, width:50},
          {name:'amount', editable:true, editOptions:{size:35},width:30},
          {name:'stockAlert', editable:true, width:30},
          {name:'applicableCarModel', editable:true,width:40}
        ],
        pager: jQuery('#accessory_list_pager'),
        viewrecords: true,
        gridview: true,
        caption:title,
        multiselect: true
      });

      
      jQuery("#accessory_list").navGrid('#accessory_list_pager',
              {add:true,edit:true,del:true,search:false,refresh:true},      // which buttons to show?
              {closeAfterEdit:true,
               afterSubmit:afterSubmitEvent
              },                                   // edit options
              {addCaption:'Create New Accessory',
               afterSubmit:afterSubmitEvent,
               savekey:[true,13]},            // add options
              {afterSubmit:afterSubmitEvent}  // delete options
          );	
}

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
