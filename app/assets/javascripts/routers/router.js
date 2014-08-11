Listable.Routers.Router = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.posts = Listable.Collections.posts;
  },

  routes: {
    '': 'index',
    'categories/:id': 'showCategory',
    'posts/:id': 'showPost',
    'manage': 'managePosts'
  },

  index: function() {
    var postsSearchableIndex = new Listable.Views.PostsSearchableIndex({
      collection: this.posts
    });

    this._swapView(postsSearchableIndex);
  },

  showCategory: function(id) {
    var category = this._getOrFetch(this.categories, id);

    var showCategory = new Listable.Views.CategoryShow({
      model: category
    });

    this._swapView(showCategory);
  },

  showPost: function(id) {
    var post = new Listable.Models.Post({ id: id });
    post.fetch();

    var postShow = new Listable.Views.PostShow({
      model: post
    });

    postShow.listenTo(postShow, "render", function() {
      $('abbr.timeago').timeago();
    });

    this._swapView(postShow);
  },

  managePosts: function() {
    var user = JSON.parse($('#user-data').text());
    var posts = new Listable.Collections.Posts;

    posts.fetch({
      data: {
        author_id: user.id
      }
    });

    var postIndex = new Listable.Views.PostsIndex({
      collection: posts
    });

    this._swapView(postIndex);
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
    this.$rootEl.html(view.render().$el);
  }
});
