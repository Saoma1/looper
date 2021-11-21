require("jquery");

function createMovieList(movieSearchResults) {
  const listResults = document.querySelector("#results");
  movieSearchResults.slice(0, 10).forEach((result) => {
    const movie = `
    <a href="./search" class='move'>
      <li class="list-inline-item li" tabindex="-1"
        data-name="${result.original_title}"
        data-release_date="${result.release_date}"
        data-overview="${result.overview}"
        data-vote_average="${result.vote_average}"
        data-genre="[${result.genre_ids}]"
        data-img="${result.poster_path}"
        data-backdrop_img="${result.backdrop_path}">
        <p>${result.original_title}</p>
      </li>
      </a>`;
    listResults.insertAdjacentHTML("beforeend", movie);
  });
  addKeyboardAccess();
}

function addKeyboardAccess() {
  var listItems = document.getElementsByClassName("move");

  for (var i = 0; i < listItems.length; i++) {
    listItems[i].addEventListener(
      "keydown",
      function (event) {
        if (event.key === "ArrowUp") {
          if (this.previousElementSibling) {
            this.previousElementSibling.focus();
          }
        } else if (event.key === "ArrowDown") {
          if (this.nextElementSibling) {
            this.nextElementSibling.focus();
          }
        }
      },
      false
    );
    listItems[i].addEventListener(
      "mouseover",
      function () {
        this.focus();
      },
      false
    );
  }
}

export { createMovieList };
