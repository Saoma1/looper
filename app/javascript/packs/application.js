import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
require("jquery");

import "@fortawesome/fontawesome-free/js/all";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

import { searchListener } from "../custom/searchAPI";
import { checkWindow } from "../custom/setObject";
import { notification } from "../custom/fade";

document.addEventListener("turbolinks:load", () => {
  searchListener();
  checkWindow();
  notification();
});
