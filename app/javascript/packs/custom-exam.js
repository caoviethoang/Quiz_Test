$(".content-start").on("click", ".show-info", function () {
  $(this).addClass("info-box");
});

$(".content-start").on("click", ".remove-info", function () {
  $(this).removeClass("info-box");
});

$(".row").on("click", ".start-exam", function () {
  $(this).removeClass("info-box");
  $(".content-start").css("display", "none");

  $(".content-question")
    .css("display", "block")
    .addClass("content-question col-12 col-md-9");

  $(".right-bar").css("display", "block").addClass("right-bar col-6 col-md-3");
});
