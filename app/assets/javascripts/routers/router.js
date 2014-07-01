Clonelist.Routers.Router = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.categories = Clonelist.Collections.categories;
  },

  routes: {
    '': 'index',
    'categories/:id': 'showCategory',
    'posts/:id': 'showPost'
  },

  index: function() {
    var categoriesIndex = new Clonelist.Views.CategoriesIndex({
      collection: this.categories
    });

    this._swapView(categoriesIndex);
  },

  showCategory: function(id) {
    var category = this._getOrFetch(this.categories, id);

    var showCategory = new Clonelist.Views.CategoryShow({
      model: category
    });

    this._swapView(showCategory);
  },

  showPost: function(id) {
    var post = new Clonelist.Models.Post({ id: id });
    post.fetch();

    var postShow = new Clonelist.Views.PostShow({
      model: post
    });

    this._swapView(postShow);
  },

  _getOrFetch: function(collection, id) {
    var model = collection.get(id);

    if (model) { 
      model.fetch();
    } else {
      model = new collection.model({ id: id });
      model.fetch({
        success: function() {
          collection.add(model);
        }
      });
    }

    return model;
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el)
  }
});
