$(document).ready(function() {
    $('.user-panel__list .user-panel__list__item').click(function() {
        $(this).next('.user-panel__sublist').slideToggle(400);
    });
});