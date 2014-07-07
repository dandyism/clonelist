window.Listable = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function($rootEl) {
    Listable.Collections.categories = new Listable.Collections.Categories;
    Listable.Collections.categories.fetch();

    new Listable.Routers.Router({ $rootEl: $rootEl });
    Backbone.history.start();
  }
};
