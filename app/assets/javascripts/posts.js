$(function () {
    $('.modal').modal();

    $('.modal-trigger-edit-post').click(function () {
        var post_id = $(this).data('postId'), controller_to_redirect = $(this).data('controllerOrigin');
        $.ajax({ url: '/posts/' + post_id +'/edit', data: { controller_to_redirect: controller_to_redirect } })
    });

    $('.remove-post').bind('ajax:success', function() {
        $(this).closest('.card.horizontal').fadeOut();
    });
});