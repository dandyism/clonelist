Clonelist.Views.CategoryShow = Backbone.View.extend({

  template: JST["categories/show"],

  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.posts(), "sync add", this.render);
  },

  events: {
    "input #search-keywords": "filter"
  },

  filter: function(event) {
    var keywords = $(event.target).val();

    this.model.posts().fetch({
      data: {
        keywords: keywords
      },

      reset: true
    });
  },

  render: function() {
    var rendered = this.template({ category: this.model });
    this.$el.html(rendered);
    return this;
  }

});
