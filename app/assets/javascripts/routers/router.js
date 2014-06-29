Clonelist.Routers.Router = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    '': 'index'
  },

  index: function() {
    var categoriesIndex = new Clonelist.Views.CategoriesIndex({
      collection: Clonelist.Collections.categories
    });

    this._swapView(categoriesIndex);
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el)
  }
});
