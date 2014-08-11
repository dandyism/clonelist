Listable.Views.PostsSearchableIndex = Backbone.View.extend({

  initialize: function(options) {
    this.listenTo(Listable.Collections.categories, "sync", this.render);
    this._postsIndex = new Listable.Views.PostsIndex({
      collection: this.collection
    });
  },

  template: JST['posts/searchable'],

  events: {
    "input #search-keywords": "filterDelay",
    "input #category": "filterDelay",
    "submit .search": "filter"
  },

   filter: function(event) {
    event.preventDefault();
    var keywords = $('#search-keywords').val();
    var category = $('#category').val();

    this.collection.fetch({
      data: {
        keywords: keywords,
        category_id: category
      },

      reset: true
    });
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

 render: function() {
    var rendered = this.template({
      categories: Listable.Collections.categories
    });

    this.$el.html(rendered);
    this.$el.append(this._postsIndex.render().$el);

    return this;
  }

});
