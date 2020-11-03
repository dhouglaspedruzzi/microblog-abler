$(function () {
    $('.notification-item').click(function () {
        const notification_id = $(this).data('id');

        $.ajax({
            url: '/notifications/mark_as_read',
            type: 'POST',
            data: { notification_id: notification_id },
            success: function (response) {
                if (response.status == 'success') {
                    document.location.reload()
                }
            }
        })
    });
})