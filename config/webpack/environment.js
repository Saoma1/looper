const { environment } = require("@rails/webpacker");

const webpack = require("webpack");

environment.plugins.prepend(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery/src/jquery",
    jQuery: "jquery/src/jquery",
  })
);

environment.plugins.prepend(
  "env",
  new webpack.DefinePlugin({
    "process.env": { RAILS_ENV: process.env.RAILS_ENV },
  })
);

module.exports = environment;
