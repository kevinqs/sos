    <div align="center">
        <h4>岗位物料单</h4>
    </div>
      
      <g:formRemote name="bomForm" url="[controller: 'workPostBom', action:'jq_edit_workPostBom']">
            <g:hiddenField name="id" value="${workPostBomInstance.id}" />
            <div class="span4">
                <div class="control-group line">
                    <label class="control-label" for="workSection">工段/班组</label>
                    <div class="controls">
                        <g:textField name="workSection" value="${workPostBomInstance.workSection}" />
                    </div>
                </div>
                <div class="line control-group line">
                    <label class="control-label" for="workPost">工位</label>
                    <div class="controls">
                        <g:textField name="workPost" value="${workPostBomInstance.workPost}" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="workPostName">岗位名称</label>
                    <div class="controls">
                        <g:textField name="workPostName" value="${workPostBomInstance.workPostName}" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="serialNumber">序列号</label>
                    <div class="controls">
                        <g:textField name="serialNumber" value="${workPostBomInstance.serialNumber}" />
                    </div>
                </div>
            </div>
            <div class="span4">
                <div class="control-group">
                    <label class="control-label" for="author">编制</label>
                    <div class="controls">
                        <g:textField name="author" value="${workPostBomInstance.author}" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="auditor">审计</label>
                    <div class="controls">
                        <g:textField name="auditor" value="${workPostBomInstance.auditor}" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="approver">批准</label>
                    <div class="controls">
                        <g:textField name="approver" value="${workPostBomInstance.approver}" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="date">日期</label>
                    <div class="controls">
                        ${workPostBomInstance.effectiveDate}
                    </div>
                </div>
            </div>
        
        <div class="span11">
        <ul class="nav nav-tabs" id="myTab">
          <li class="active"><a href="#parts">直接物料表</a></li>
          <li><a href="#accessories">间接物料（辅料,材料）</a></li>
          <li><a href="#tools">工具</a></li>
          <li><a href="#fixtures">夹具/其他</a></li>
          <li><a href="#ppe">劳防用品</a></li>
        </ul>
         
        <div class="tab-content">
            <div class="tab-pane active" id="parts">home</div>
            <div class="tab-pane" id="accessories">profile</div>
            <div class="tab-pane" id="tools">
                messages
                messages
                messages
                messages
                messages
                messages
                messages
                messages
                messages
                messages
                messages
                messages
                messages
                messages
                messages
                messages
                messages
            </div>
          <div class="tab-pane" id="fixtures">settings</div>
          <div class="tab-pane" id="ppe">PPE</div>
        </div>
        </div>
        <div class="row">
            <div class="span11"  style="height:35px;">
            </div>
        <div/>
        <div class="row">
            <div class="span11" align="right">
                <g:submitButton name="save" value="Save" class="btn btn-primary"/>
                <button class="btn" type="button">Cancel</button>
            </div> 
        </div>
        </g:formRemote>
        <!-- /container -->

     
    <script type="text/javascript">
      $(function () {
        $('#myTab a:last').tab('show');
        if (true) {
            var trace = printStackTrace();
            alert(trace.join('\n\n'));
       }
      });
      
    $('#myTab a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
    });
    </script>   
