Clonelist.Views.PostShow = Backbone.View.extend({

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },
  
  template: JST['posts/show'],

  render: function() {
    var rendered = this.template({ post: this.model });
    this.$el.html(rendered);
    return this;
  }

});
