_.templateSettings = { interpolate : /\{\{(.+?)\}\}/g };

User = Backbone.Model.extend({
    initialize: function() {
        this.on('all', function(e) { console.log(this.get('name') + " event: " + e); });
    },
    defaults: {
        //TODO
    },
    urlRoot: "/vcloud/user"
});
