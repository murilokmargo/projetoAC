$(function() {
    $('[data-channel-subscribe="dm"]').each(function() {
        App.cable.subscriptions.create(
            {
                channel: "AppearanceChannel"
            },
            {
                received: function(data) {
                    $("p").each(function (){
                        console.log($(this).text())
                        if ($(this).text() == data.username){
                            $(this).children().css("color", "limegreen")
                        }
                    })
                }
            }
        );
    });
});