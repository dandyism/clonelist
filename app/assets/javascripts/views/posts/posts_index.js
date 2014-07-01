Clonelist.Views.PostsIndex = Backbone.View.extend({

  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
  },

  template: JST['posts/index'],

  render: function() {
    var rendered = this.template({ posts: this.collection });
    this.$el.html(rendered);
    return this;
  }

});
