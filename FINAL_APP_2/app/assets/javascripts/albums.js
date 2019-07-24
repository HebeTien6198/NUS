

$("document").ready(function(){
  // Multiple images preview in browser
  var imagesPreview = function (input, placeToInsertImagePreview) {
    if (input.files) {
      var filesAmount = input.files.length;

      for (i = 0; i < filesAmount; i++) {
        var reader = new FileReader();

        reader.onload = function (event) {
          $($.parseHTML('<img id="output_image">')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
        }

        reader.readAsDataURL(input.files[i]);
      }
    }

  };

  $('#gallery-photo-add').on('change', function () {
    alert("cc");
    imagesPreview(this, 'div.gallery');
  });
});




  