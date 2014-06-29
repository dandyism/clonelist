Clonelist.Views.CategoryShow = Backbone.View.extend({

  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render);
  },

  template: JST["templates/category"],

  render: function() {
    var rendered = this.template({ category: this.model });
    this.$el.html(rendered);
    return this;
  }

});
