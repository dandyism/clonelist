Clonelist.Models.Category = Backbone.Model.extend({
  urlRoot: '/categories',

  posts: function() {
    this._posts = this._posts ||
      new Clonelist.Collections.Posts([], { category: this });

    return this._posts
  },

  parse: function(response) {
    console.log(response);
    if (response.posts) { 
      alert("GOT IT");
      this.posts().set(response.posts, { parse: true });
      delete response.posts;
    }

    return response;
  }
});
