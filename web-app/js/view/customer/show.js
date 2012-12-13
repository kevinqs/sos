 var ShowCustomer = Backbone.View.extend({

	 template :"dust/templates/customers/show",

    events : {},

    initialize : function() {
    	 var self = this;
      this.model.fetch({success : _.bind(this.onSuccess, this)});
      },
	render: function(){
		var result;
		var a = {};
		a.model = this.model.toJSON();
		dust.render("dust/templates/customers/show", a, function(err, output) { result = output});
	    $("#customercontent").html(result);
	    return this;
	},
	onSuccess:function(models){
		this.render();
	}
    
    
});
 

//@ sourceURL=vcc/show.js