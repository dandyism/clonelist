Clonelist.Views.CategoryShow = Backbone.View.extend({

  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.posts(), "sync", this.render);
  },

  template: JST["categories/show"],

  render: function() {
    var rendered = this.template({ category: this.model });
    this.$el.html(rendered);
    return this;
  }

});
