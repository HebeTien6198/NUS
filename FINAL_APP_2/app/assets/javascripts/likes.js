$("document").ready(function(){
  // Follow and Unfollow
  $(".like").click(function() {
   likeable_type = $(this).attr('likeable_type');
   likeable_id = $(this).attr('likeable_id');
   like = this;
   if ($(this).attr("action") == "like") {
       Rails.ajax({
           url: "/like",
           contentType: "application/json",
           type: "post",
           dataType: "json",
           data: $.param({ likeable_type: likeable_type, likeable_id: likeable_id }),
           // data: "follower_id=>cc, following_id=>ccc",
           success: function(data) {
               $(like).css("color", "red");
               $(like).text(" " + data["num_of_likes"]);
               $(like).attr("action", "unlike");
           },
           error: function(data) {
               alert(data)
           }
       });
   } else {
       Rails.ajax({
           url: "/unlike",
           contentType: "application/json",
           type: "delete",
           dataType: "json",
           data: $.param({ likeable_type: likeable_type, likeable_id: likeable_id }),

           // data: "follower_id=>cc, following_id=>ccc",
           success: function(data) {
            $(like).css("color", "blue");
            $(like).text(" " + data["num_of_likes"]);
            $(like).attr("action", "like");
           },
           error: function(data) {
               alert(data)
           }
       });
   }


});
});

