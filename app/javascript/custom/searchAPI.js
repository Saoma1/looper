// require("dotenv").config();
import { createMovieList } from "./populateList";
import { switchToSearch } from "./switch";

async function searchListener() {
  const searchInputField = document.querySelector("#search_input");
  searchInputField.addEventListener("keyup", async (evt) => {
    if (evt.key == "ArrowUp" || evt.key == "ArrowDown") {
      return;
    }
    evt.preventDefault();
    const movieResults = await fetchSearch(search_input.value);
    clearMovieList();
    createMovieList(movieResults);
    addClickListener();
  });
}

async function fetchSearch(searchInput) {
  const searchUrl = `https://api.themoviedb.org/3/search/movie?api_key=${process.env.TMDB_API_KEY}&query=`;
  const data = await fetch(`${searchUrl} + ${searchInput}`)
    .then((response) => response.json())
    .then((data) => {
      return data.results;
    });
  return data;
}

function clearMovieList() {
  const listResults = document.querySelector("#results");
  listResults.innerHTML = "";
}

async function addClickListener() {
  const itemsClick = document.querySelectorAll(".li");
  const itemsKey = document.querySelectorAll("a");
  itemsClick.forEach((item) => {
    item.addEventListener("click", async (evt) => {
      evt.preventDefault();
      innerListener(evt.currentTarget);
    });
  });
  itemsKey.forEach((item) => {
    item.addEventListener("keydown", async (evt) => {
      if (evt.key === "Enter") {
        evt.preventDefault();
        innerListener(evt.target.querySelector("li"));
      }
    });
  });
}

async function innerListener(evt) {
  sessionStorage.clear();
  const movieData = await createMovieObject(evt);
  sessionStorage.setItem("movieData", JSON.stringify(movieData));
  clearMovieList();
  switchToSearch();
}

async function fetchMovieGenres(genreIds) {
  const genreURL = `https://api.themoviedb.org/3/genre/movie/list?api_key=${process.env.TMDB_API_KEY}&language=en-US`;
  const data = await fetch(genreURL)
    .then((response) => response.json())
    .then((data) => {
      return genreIds.map((genreId) => data.genres.find((x) => x.id === genreId).name);
    });
  return data;
}

async function createMovieObject(clickedItem) {
  const fn = (data) => $(clickedItem).data(data);
  const genre = await fetchMovieGenres($(clickedItem).data("genre"));
  sessionStorage.setItem("name", fn("name"));
  const movieObj = {
    name: fn("name"),
    release_date: fn("release_date"),
    overview: fn("overview"),
    vote_average: fn("vote_average"),
    genre: genre,
    img: fn("img"),
    imgBackdrop: fn("backdrop_img"),
  };
  return movieObj;
}

export { searchListener };
