// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require materialize-sprockets
//= require_tree .

function getCountNewNotifications () {
    $.ajax({
        url: '/notifications/get_new_count',
        success: function (response) {
            let span = $('#menu_notification_item').find('span.secondary-content');
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

setInterval(getCountNewNotifications, 5000);
