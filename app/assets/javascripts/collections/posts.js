Clonelist.Collections.Posts = Backbone.Collection.extend({
  url: function() {
    return this.category.url() + '/posts';
  },

  model: Clonelist.Models.Post,

  initialize: function(models, options) {
    this.category = options.category;
  }

});
