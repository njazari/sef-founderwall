var hospital_page = {}

function getJump(link) {
    return function () { 
        $(document).scrollTop($('#' + link.attr('name') + '_header').offset().top); 
        return false;
    };
}

hospital_page.setup = function() {
    var jumplinks = $('.jump');
    for (var i = 0; i < jumplinks.length; i++) {
        var link = $(jumplinks[i]);
        $(link).bind('click', getJump(link));
    }
};

$(hospital_page.setup);