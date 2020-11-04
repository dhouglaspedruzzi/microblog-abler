$(function () {
    $('.notification-item').click(function () {
        var notification_id = $(this).data('id');

        $.ajax({
            url: '/notifications/mark_as_read',
            type: 'POST',
            data: { notification_id: notification_id }
        })
    });
})