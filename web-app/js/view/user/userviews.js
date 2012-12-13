_.templateSettings = { interpolate : /\{\{(.+?)\}\}/g };

UserView = Backbone.View.extend({
    initialize: function(){
    	this.model.bind('change:message', this.change, this);
    },    
    el: '#container',
    render: function(){
        console.log(this.model.toJSON())        
        var template = _.template( $("#user_template").html());
        this.$el.html( template(this.model.toJSON()));
        return;
    },
    change:function(){
    	this.render()
    },            
});

UserPrivilegeView = Backbone.View.extend({
    initialize: function(){
    },
    el: '#privilegeList',
    render: function(){
    	var template = _.template( $("#privileges_template").html());
    	var privileges = this.model.get('privileges')
    	_.each(privileges, function(num, key){ 
        	console.log(JSON.stringify(num));
        	var data = {app:num.app,privilege:num.privilege}
        	this.$el.append(template(data))
        },this);    	
        return;
    }       
});

UserDeviceView = Backbone.View.extend({
    initialize: function(){
    },
    el: '#devicesList',
    render: function(){
    	var template = _.template( $("#devices_template").html());
    	var devices = this.model.get('devices')
    	 _.each(devices, function(num, key){ 
        	console.log(JSON.stringify(num));
        	var data = {name:num.name}
        	this.$el.append(template(data))
        },this);    	
        return;
    }       
});

UserStatsView = Backbone.View.extend({
    initialize: function(){ 
    },
    el: '#container',
    render: function(){
    	var template = _.template( $("#stats_template").html());
    	console.log(JSON.stringify(this.model))
    	var stats = this.model.get('stats')
    	var data = {sessions:stats.sessions,lastSession:stats.lastSession,devices:stats.devices}
    	this.$el.append(template(data))    	
        return;
    }       
});

UserActionView = Backbone.View.extend({
	initialize: function(){
		this.model.bind('change:actions', this.change, this);
    },
    el: '#actionsList',   
    render: function(){
    	var template = _.template( $("#actions_template").html());
    	var actions = this.model.get('actions');
    	console.log(actions)
    	 _.each(actions, function(num, key){ 
        	console.log(JSON.stringify(num));
        	var data = {name:num.name,label:num.label}
        	console.log(data)
        	this.$el.append(template(data))
        },this);    	
        return;
    },
    change:function(){
    	console.log("actions changed")
    	this.$el.children().remove()
    	this.render()
    },
    events: {
        "click #enable": "enable",
        "click #disable": "disable",
        "click #delete": "delete"
    },
    enable:function() {
    	console.log("click on enable")
    	var dataId = this.model.get('dataId');
    	console.log(dataId)
    	var model = this.model
    	$.ajax({
			async: false,
			url:"/vcloud/user/enable/" + dataId,
			method:"post",
			dataType:"json",
			context:model,
			success:function(d,r,o) {
				model.set("actions",d["actions"])
				model.set("message",d["message"])
				model.set("status",d["status"])
			},
			error: function(d,r,o) {
				console.log(d)
			}
		});
    },
    disable:function() {
    	console.log("click on disable")
    	var dataId = this.model.get('dataId');
    	console.log(dataId)
    	var model = this.model
    	$.ajax({
			async: false,
			url:"/vcloud/user/disable/" + dataId,
			method:"post",
			dataType:"json",
			context:model,
			success:function(d,r,o) {
				model.set("actions",d["actions"])
				model.set("message",d["message"])
				model.set("status",d["status"])
			},
			error: function(d,r,o) {
				console.log(d)
			}
		},this);
    },
    delete:function() {
    	console.log("click on delete")
    	this.model.destroy({
  	      success: function(model, response){
  	        console.log("Success")
  	      },
  	      error: function(model, response){
  	        console.log("Error")
  	      }
  	    });
    }
});
