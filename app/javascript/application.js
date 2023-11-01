// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import * as ActiveStorage from "@rails/activestorage";
import '@hotwired/turbo-rails';

// import "./channels";
import "jquery";
import "@fortawesome/fontawesome-free/js/all";

ActiveStorage.start();

import { searchListener } from "./custom/searchAPI";
import { checkWindow } from "./custom/setObject";
import { notification } from "./custom/fade";

document.addEventListener("turbo:load", () => {
    searchListener();
    checkWindow();
    notification();
});


console.log("hello")