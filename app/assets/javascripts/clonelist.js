window.Clonelist = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function($rootEl) {
    Clonelist.Collections.categories = new Clonelist.Collections.Categories;
    Clonelist.Collections.categories.fetch();

    new Clonelist.Routers.Router({ $rootEl: $rootEl });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Clonelist.initialize();
});
