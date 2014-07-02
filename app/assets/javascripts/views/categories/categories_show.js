Clonelist.Views.CategoryShow = Backbone.View.extend({

  template: JST["categories/show"],

  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render);

    this._postIndexView = new Clonelist.Views.PostsIndex({ collection: this.model.posts() });
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
    this.$el.append(this._postIndexView.render().$el);
    return this;
  },

  remove: function() {
    this._postIndexView.remove();
    return Backbone.View.prototype.remove.apply(this);
  }

});
