$("document").ready(function() {
    feed = function() {
        $("#feed").addClass("a-active");
        $("#discover").removeClass("a-active");
    }

    discover = function() {
        $("#feed").removeClass("a-active");
        $("#discover").addClass("a-active");
    }
    
    album = function() {
        $("#album").addClass("bigger-button");
        $("#photo").removeClass("bigger-button");
    }

    photo = function() {
        $("#album").removeClass("bigger-button");
        $("#photo").addClass("bigger-button");
    }
});


