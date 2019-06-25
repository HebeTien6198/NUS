
$("#document").ready(function() {
    //-----------------For switching Photo and Album tab ------------------------- 
    $("#photo-button").click(function(){
        $("#photo").addClass("active");
        $("#album").removeClass("active");
        $("#photo-button").addClass("btn-primary");
        $("#album-button").removeClass("btn-primary");
    });

    $("#album-button").click(function(){
        $("#album").addClass("active");
        $("#photo").removeClass("active");
        $("#album-button").addClass("btn-primary");
        $("#photo-button").removeClass("btn-primary");
    });
});