var hospital_page = {}

function jump(link) {
    var anchor = $('#' + link.attr('name') + '_header');
    $(document).scrollTop(anchor.offset().top); 
    return false;
}

hospital_page.setup = function() {
    var jumplinks = $('.jump');
    for (var i = 0; i < jumplinks.length; i++) {
        var link = $(jumplinks[i]);
        $(link).click( function () { jump(link); return false; });
    }
};

$(hospital_page.setup);