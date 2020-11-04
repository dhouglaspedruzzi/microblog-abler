$(function () {
    $('.notification-item').click(function () {
        var notification_id = $(this).data('id');

        $.ajax({
            url: '/notifications/mark_as_read',
            type: 'POST',
            data: { notification_id: notification_id }
        })
    });

    function getCountNewNotifications () {
        $.ajax({
            url: '/notifications/get_new_count',
            success: function (response) {
                var span = $('#menu_notification_item').find('span.secondary-content');
                span.html('');
                span.removeClass('new badge');

                if (response.status == 'success') {

                    if (response.count > 0) {
                        span.html(response.count);
                        span.addClass('new badge');
                    }
                }
            }
        })
    }

    setInterval(getCountNewNotifications, 15000);
})