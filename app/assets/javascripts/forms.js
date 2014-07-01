$(function() {
  $('form').on('click', 'button.autofill', function(event) {
    event.preventDefault()
    event.stopPropagation();

    var form = event.delegateTarget;
    var data = JSON.parse($('#autofill-data').html());
    var $button = $(event.target);
    $button.toggleClass('loading');
    $button.attr('disabled', true);

    _(Object.keys(data)).each(function(key) {
      $(form).children('[id=' + key + ']').val(data[key]);
    });

    $button.toggleClass('loading');
  });
});
