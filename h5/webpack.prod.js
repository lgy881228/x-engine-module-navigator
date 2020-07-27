const merge = require("webpack-merge");
const common = require("./webpack.config.js");
module.exports = merge(common, {
  // production  development none
  mode: "production",
  // debug in production with source map
  devtool: "source-map",
  plugin: [
    // auto reload
    new webpack.HotModuleReplacementPlugin(),
    // auto inject
    new HtmlWebpackPlugin({
      title: "this is the title",
      template: "./src/index.html",
    }),
  ],
});
