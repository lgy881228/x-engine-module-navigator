var path = require("path");
const glob = require("glob");
const merge = require('webpack-merge');
const common = require("./webpack.config.js");

module.exports = merge(common, {
  // when debug in browser,  it will show the source
  devtool: "inline-source-map",
  devServer: {
    contentBase: "./dist",
  },
  mode: "development",
  entry: glob.sync("./test/*_spec{,s}.js").map(function (file) {
    return path.resolve(__dirname, file);
  }),
  output: {
    // save the resulting bundle in the ./tmp/ directory
    path: path.resolve("./tmp/"),
    filename: "compiled.js",
  },
});
