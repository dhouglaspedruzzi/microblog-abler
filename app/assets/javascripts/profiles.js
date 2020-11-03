$(function () {
    $('#btn_follow').click(function () {
        let user_to_follow_id = $(this).data('userToFollowId'), btn = $(this);

        $.ajax({
            url: '/followers/handle',
            data: { user_to_follow_id: user_to_follow_id },
            success: function (response) {
                if (response.status === 'follow') {
                    btn.html('Seguindo');
                    M.toast({html: 'Seguindo', classes: 'teal lighten-2'});
                } else {
                    btn.html('Seguir');
                }
            }
        })
    });
});