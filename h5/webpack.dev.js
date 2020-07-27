const common = require("./webpack.config.js");

module.exports = {
  ...common,
  ...{
    // when debug in browser,  it will show the source
    devtool: "inline-source-map",
    devServer: {
      contentBase: "./dist",
    },
    mode: "development",
  },
};
