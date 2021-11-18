function notification() {
  setTimeout(function () {
    $(".notification").fadeOut("slow", function () {
      $(this).remove();
    });
  }, 5000);
}

export { notification };
