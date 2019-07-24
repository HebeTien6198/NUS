
$("document").ready(function(){
   // Follow and Unfollow
   $(".follow").click(function() {
    follower_id = $(this).attr('follower_id');
    following_id = $(this).attr('following_id');
    alert(follower_id);
    alert(following_id);
    follow = this;
    if (follower_id == -1) {
      alert("You need to login");
      return;
    }
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
            url: "/follow",
            contentType: "application/json",
            type: "delete",
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
});
