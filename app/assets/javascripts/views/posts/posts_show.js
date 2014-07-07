Listable.Views.PostShow = Backbone.View.extend({

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "mouseenter .post-thumbnails li": "swapImage"
  },

  swapImage: function(event) {
    $img = $('#post-image');
    $thumb = $(event.currentTarget).find('img');

    $img.attr('src', $thumb.attr('src'));

    $('.active-thumbnail').removeClass('active-thumbnail');
    $(event.currentTarget).addClass('active-thumbnail');
  },

  autoNumeric: function() {
    this.$('.post-price').autoNumeric('init', { aSign: '$' });
  },
  
  template: JST['posts/show'],

  render: function() {
    var rendered = this.template({
      post: this.model,
      images: this.model.get('image_urls')
    });

    this.$el.html(rendered);
    this.autoNumeric();
    this.trigger("render");
    return this;
  }

});
