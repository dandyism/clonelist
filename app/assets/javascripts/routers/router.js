Clonelist.Routers.Router = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.categories = Clonelist.Collections.categories;
  },

  routes: {
    '': 'index',
    'categories/:id': 'showCategory'
  },

  index: function() {
    var categoriesIndex = new Clonelist.Views.CategoriesIndex({
      collection: this.categories
    });

    this._swapView(categoriesIndex);
  },

  showCategory: function(id) {
    var router = this;
    var category = this.categories.get(id);

    if (!category) { 
      category = new Clonelist.Models.Category({ id: id });
      category.fetch({
        success: function() {
          router.categories.add(category);
        }
      });
    }

    var showCategory = new Clonelist.Views.CategoryShow({
      model: category
    });

    this._swapView(showCategory);
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el)
  }
});
