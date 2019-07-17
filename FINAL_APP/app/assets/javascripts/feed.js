$("#document").ready(function() {
    //-----------------For switching Photo and Album tab ------------------------- 
    $("#photo-button").click(function() {
        $("#photo").addClass("active");
        $("#album").removeClass("active");
        $("#photo-button").addClass("btn-primary");
        $("#album-button").removeClass("btn-primary");
    });

    $("#album-button").click(function() {
        $("#album").addClass("active");
        $("#photo").removeClass("active");
        $("#album-button").addClass("btn-primary");
        $("#photo-button").removeClass("btn-primary");
    });

    // Like and Unlike
    $(".like").click(function() {
        alert("like");
        user_id = $(this).attr('user_id');
        photo_id = $(this).attr('photo_id');
        like = this

        console.log($(this).attr("liked"));
        if ($(this).attr("liked") == "false") {
            Rails.ajax({
                url: "/like",
                contentType: "application/json",
                type: "post",
                dataType: "json",
                data: $.param({ Photo_id: photo_id, User_id: user_id }),

                // data: "follower_id=>cc, following_id=>ccc",
                success: function(data) {
                    $(like).addClass("text-primary");
                    $(like).attr("liked", "true");
                    let id = ".numOfLikes" + photo_id;
                    let numOfLikes = parseInt($(like).attr('numOfLikes'), 10);
                    $(like).attr('numOfLikes', numOfLikes + 1);
                    let c = ".numOfLikes" + photo_id;
                    $(c).text(numOfLikes + 1);
                },
                error: function(data) {
                    alert(data)
                }
            });
        } else {
            var mydata = { User_id: 1, Photo_id: 1 }
            Rails.ajax({
                url: "/unlike",
                contentType: "application/json",
                type: "post",
                dataType: "json",
                data: $.param({ Photo_id: photo_id, User_id: user_id }),

                // data: "follower_id=>cc, following_id=>ccc",
                success: function(data) {
                    $(like).removeClass("text-primary");
                    $(like).attr("liked", "false");
                    let id = ".numOfLikes" + photo_id;
                    let numOfLikes = parseInt($(like).attr('numOfLikes'), 10);
                    $(like).attr('numOfLikes', numOfLikes - 1);
                    let c = ".numOfLikes" + photo_id;
                    $(c).text(numOfLikes - 1);
                },
                error: function(data) {
                    alert(data)
                }
            });
        }
    });

    $(".likePhotoIcon").click(function() {
        alert("like like cc");
        user_id = $(this).attr('user_id');
        photo_id = $(this).attr('photo_id');
        like = this

        console.log($(this).attr("liked"));
        if ($(this).attr("liked") == "false") {
            Rails.ajax({
                url: "/like",
                contentType: "application/json",
                type: "post",
                dataType: "json",
                data: $.param({ Photo_id: photo_id, User_id: user_id }),

                // data: "follower_id=>cc, following_id=>ccc",
                success: function(data) {
                    $(like).css("color", 'red');
                    $(like).attr("liked", "true");
                    $(like).text(" " + data["numOfLikes"]);
                },
                error: function(data) {
                    alert(data)
                }
            });
        } else {
            var mydata = { User_id: 1, Photo_id: 1 }
            Rails.ajax({
                url: "/unlike",
                contentType: "application/json",
                type: "post",
                dataType: "json",
                data: $.param({ Photo_id: photo_id, User_id: user_id }),

                // data: "follower_id=>cc, following_id=>ccc",
                success: function(data) {
                    $(like).css("color", 'blue');
                    $(like).attr("liked", "false");
                    $(like).text(" " + data["numOfLikes"]);
                },
                error: function(data) {
                    alert(data)
                }
            });
        }
    });



    // Follow and Unfollow
    $(".follow").click(function() {
        alert("cc");
        follower_id = $(this).attr('follower_id');
        following_id = $(this).attr('following_id');
        follow = this;

        if ($(this).attr("followed") == "false") {
            Rails.ajax({
                url: "/follow",
                contentType: "application/json",
                type: "post",
                dataType: "json",
                data: $.param({ follower_id: follower_id, following_id: following_id }),

                // data: "follower_id=>cc, following_id=>ccc",
                success: function(data) {

                    $(follow).removeClass("btn-outline-primary");
                    $(follow).addClass("btn-primary");
                    $(follow).text("Following");
                    $(follow).attr("followed", "true");
                },
                error: function(data) {
                    alert(data)
                }
            });
        } else {
            Rails.ajax({
                url: "/unfollow",
                contentType: "application/json",
                type: "post",
                dataType: "json",
                data: $.param({ follower_id: follower_id, following_id: following_id }),

                // data: "follower_id=>cc, following_id=>ccc",
                success: function(data) {

                    $(follow).addClass("btn-outline-primary");
                    $(follow).removeClass("btn-primary");
                    $(follow).text("Follow");
                    $(follow).attr("followed", "false");
                },
                error: function(data) {
                    alert(data)
                }
            });
        }


    });


    //--------------Comments---------------------
    $(".comment").keyup(function(e) {
        comment = this;
        content = $(this).val();
        Photo_id = $(this).attr("photo_id");
        if (e.keyCode == 13) {
            if (content == "") {
                alert("You must enter something");
                return;
            }
            Rails.ajax({
                url: "/comment",
                contentType: "application/json",
                type: "post",
                dataType: "json",
                data: $.param({ content: content, Photo_id: Photo_id }),

                success: function(data) {
                    comments = "#comments" + Photo_id;
                    $(comments).append(content + '<br />');
                    $(comment).val("");
                },
                error: function(data) {
                    alert(data)
                }
            });
        }
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
    //  });














    //-----------------------Dymanic form-----------------------------
    post = function(fields) {
        var form = $('<form method="post" id="mapForm"></form>')
            .attr({ action: "/feed/logOut", style: 'display: none;' });
        for (var key in fields) {
            if (fields.hasOwnProperty(key)) {
                form.append($('<input type="hidden">').attr({ name: key, value: fields[key] }));
            }
        }
        $('body').append(form);

        form.submit();
    }

});