<g:javascript src="sos/workPostMaterialList.js"/>
<script type="text/javascript">

  var toolTableTitle = '<g:message code="tool.list.title"/>';

  var toolTableColumnNames = ['<g:message code="workPostPart.id.label"/>',
                              '<g:message code="tool.name.label"/>',
                              '<g:message code="tool.sku.label"/>',
                              '<g:message code="tool.model.label"/>', 
                              '<g:message code="tool.parameter.label"/>', 
                              '<g:message code="tool.consumption.label"/>'];

  var accessoryTableTitle = '<g:message code="accessory.list.title"/>'

  var accessoryTablecolumnNames = ['<g:message code="part.id.label"/>',
                                   '<g:message code="accessory.sku.label"/>',
                                   '<g:message code="accessory.name.label"/>',
                                   '<g:message code="accessory.stationTool.label"/>',
                                   '<g:message code="accessory.amount.label"/>',
                                   '<g:message code="accessory.stockAlert.label"/>',
                                   '<g:message code="accessory.applicableCarModel.label"/>'];

  var workPostPartTableTitle = '<g:message code="workPostPart.list.title"/>';
  
  var workPostPartTablecolumnNames = ['<g:message code="part.id.label"/>',
                                      '<g:message code="workPostPart.id.label"/>',
                                      '<g:message code="part.partNumber.label"/>',
                                      '<g:message code="part.colorCode.label"/>',
                                      '<g:message code="part.partName.label"/>',
                                      '<g:message code="workPostPart.amount.label"/>',
                                      '<g:message code="workPostPart.stationTool.label"/>',
                                      '<g:message code="workPostPart.stockAlert.label"/>',
                                      '<g:message code="part.applicableCarModel.label"/>'];
  
  var fixtureTableTitle = '<g:message code="fixture.list.title"/>';

  var fixtureTablecolumnNames = ['<g:message code="fixture.id.label"/>',
                                 '<g:message code="fixture.name.label"/>',
                                 '<g:message code="fixture.model.label"/>',
                                 '<g:message code="fixture.application.label"/>'];

	  /* when the page has finished loading.. execute the follow */
  $(document).ready(function () {
      initWorkPostPartList(workPostPartTableTitle,workPostPartTablecolumnNames);
	  initToolList(toolTableTitle, toolTableColumnNames);
	  initAccessoryList(accessoryTableTitle, accessoryTablecolumnNames);
	  initFixtureList(fixtureTableTitle, fixtureTablecolumnNames);
  });
          
</script>
<div class="nav" role="navigation">
	<ul>
	</ul>
</div>

<div>
    <div id='message' class="message" style="display:none;"></div>
</div>			

<div class="table-row">
	<div style="float:left;width:52%;">
	    <table id="work_post_part_list"></table>
	    <!-- pager will hold our paginator -->
	    <div id="work_post_part_list_pager"></div>
	</div>
	
	<div style="float:right;width:48%;">
	    <table id="tool_list"></table>
	    <!-- pager will hold our paginator -->
	    <div id="tool_list_pager"></div>
	</div>
</div>
<div style="height:5;"></div>
<div class="table-row">
	<div style="float:left;width:52%;">
	    <table id="accessory_list"></table>
	    <!-- pager will hold our paginator -->
	    <div id="accessory_list_pager"></div>
	</div>
	<div style="float:right;width:48%;">
	    <table id="fixture_list"></table>
	    <!-- pager will hold our paginator -->
	    <div id="fixture_list_pager"></div>
	</div>
</div>

