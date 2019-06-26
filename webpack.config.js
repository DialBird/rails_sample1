module.exports = {
  entry: './javascripts/index.js',
  output: {
    path: __dirname + '/app/assets/javascripts',
    filename: 'main.js',
  },
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
      }
    ]
  }
};
