Listable.Collections.Posts = Backbone.Collection.extend({
  url: function() {
    if (this.category) { 
      return this.category.url() + '/posts';
    } else {
      return '/posts';
    }
  },

  model: Listable.Models.Post,

  initialize: function(models, options) {
    if (options) { 
      this.category = options.category;
    }
  }

});
