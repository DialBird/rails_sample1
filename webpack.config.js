const path = require('path')
const enabledSourceMap = process.env.WEBPACK_MODE === "development";
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

module.exports = {
  entry: {
    bundle: './frontend/javascripts/index.js',
  },
  output: {
    path: __dirname + '/app/assets/javascripts',
    filename: '[name].js',
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: '../stylesheets/[name].css',
    }),
  ],
  module: {
    rules: [
      {
        test: /\.js$/,
        use: [
          {
            loader: 'babel-loader',
            options: {
              presets: ['@babel/preset-env']
            }
          }
        ]
      },
      {
        test: /\.(c|sc)ss$/,
        use: [
          MiniCssExtractPlugin.loader,
          {
            loader: 'css-loader',
            options: {
              url: false,
              sourceMap: enabledSourceMap,
              importLoaders: 2
            },
          },
          {
            loader: 'sass-loader',
            options: {
              sourceMap: enabledSourceMap
            },
          },
        ]
      }
    ]
  }
};
