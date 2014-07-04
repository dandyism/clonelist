Clonelist.Views.CategoryShow = Backbone.View.extend({

  template: JST["categories/show"],

  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render);

    this._postIndexView = new Clonelist.Views.PostsIndex({ collection: this.model.posts() });
  },

  events: {
    "input #search-keywords": "filterDelay",
    "submit .search": "filter"
  },

  filterDelay: function(event) {
    event.preventDefault();
    if (this._searchTimeout) { 
      window.clearTimeout(this._searchTimeout);
    }
 
    var view = this;
    this._searchTimeout = setTimeout(function() {
      view.filter(event);
    }, 500);
  },

  filter: function(event) {
    event.preventDefault();
    var keywords = $('#search-keywords').val();

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
