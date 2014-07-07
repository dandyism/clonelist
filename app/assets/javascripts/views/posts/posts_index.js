Listable.Views.PostsIndex = Backbone.View.extend({

  className: 'posts-index', 

  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
  },

  template: JST['posts/index'],

  autoNumeric: function() {
    this.$('.post-price-data').autoNumeric('init', { aSign: '$' });
  },

  render: function() {
    var rendered = this.template({ posts: this.collection });
    this.$el.html(rendered);

    if (this.collection.length === 0) { 
      this.$el.addClass('posts-index-empty');
    } else {
      this.$el.removeClass('posts-index-empty');
    }

    this.autoNumeric();

    return this;
  }

});
