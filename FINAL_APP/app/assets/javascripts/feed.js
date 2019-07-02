
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

    //----------------------Log out--------------------------------
    // $("#log-out").click(function(){
    //     var form = $('<form method="post" id="logOut"></form>')
    //         .attr({action: "logOut", style: 'display: none;'});
    //         form.append($('<input name="utf8" type="hidden" value="&#x2713;" />'));
    //         form.append($('<input type="hidden" name="authenticity_token" value="lSt...hbIg==" />'));
    //         form.append($('<input type="submit" value="submit" />'));
	// 	// form.append($('<input type="hidden">').attr({name: "logOut", value: "true"}));
	// 	$('body').append(form);
	// 	form.submit();
    // });





















    //-----------------------Dymanic form-----------------------------
    post = function(fields) {		
        var form = $('<form method="post" id="mapForm"></form>')
                .attr({action: "/feed/logOut", style: 'display: none;'});
        for (var key in fields) {
            if (fields.hasOwnProperty(key)) {
            form.append($('<input type="hidden">').attr({name: key, value: fields[key]}));
            }
        }
        $('body').append(form);

        form.submit();
    }
});