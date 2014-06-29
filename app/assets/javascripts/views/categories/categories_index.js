Clonelist.Views.CategoriesIndex = Backbone.View.extend({

  initialize: function(options) {
    this.listenTo(this.collection, "sync", this.render);
  },

  template: JST['categories/index'],

  render: function() {
    var rendered = this.template({ categories: this.collection });
    this.$el.html(rendered)
    return this;
  }

});
