$(function () {
    $('.notification-item').click(function () {
        let notification_id = $(this).data('id'), element = $(this);

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