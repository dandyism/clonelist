Clonelist.Views.PostShow = Backbone.View.extend({

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },
  
  template: JST['posts/show'],

  render: function() {
    var rendered = this.template({
      post: this.model,
      images: this.model.get('image_urls')
    });

    this.$el.html(rendered);
    this.trigger("render");
    return this;
  }

});
