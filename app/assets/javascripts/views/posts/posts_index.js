Clonelist.Views.PostsIndex = Backbone.View.extend({

  className: 'posts-index', 

  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
  },

  template: JST['posts/index'],

  render: function() {
    var rendered = this.template({ posts: this.collection });
    this.$el.html(rendered);

    if (this.collection.length === 0) { 
      this.$el.addClass('posts-index-empty');
    } else {
      this.$el.removeClass('posts-index-empty');
    }

    return this;
  }

});
