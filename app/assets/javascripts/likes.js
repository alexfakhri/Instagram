// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

var ready = function() {
    $('.post-like').on('click', function(event) {
        event.preventDefault();
        var likeCount = $(this).siblings('.like_count');
        $.post(this.href, function(response) {
            likeCount.text(response.new_like_count);
        });
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);