Clonelist.Collections.Categories = Backbone.Collection.extend({
  url: '/categories',
  model: Clonelist.Models.Category,

  initialize: function(options) {
    this.category = options.category;
  }
});
