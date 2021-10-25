const { webpackConfig, merge } = require('@rails/webpacker')

const customConfig = {
  resolve: {
    extensions: [".css", ".scss"]
  }
}

module.exports = merge(customConfig, webpackConfig)
