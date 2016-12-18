var path = require( 'path' );
var webpack = require( 'webpack' );
var HtmlWebpackPlugin = require( 'html-webpack-plugin' );

var entryPath = path.join( __dirname, 'src/static/index.js' );
var outputPath = path.join( __dirname, 'dist' );

module.exports = {
  entry: [
    'webpack-dev-server/client?http://localhost:8080',
    entryPath
  ],

  output: {
    path: outputPath,
    filename: path.join( 'static/js/', '[name].js'),
    publicPath: '/'
  },

  resolve: {
    extensions: ['', '.js', '.elm']
  },

  devServer: {
    // serve index.html in place of 404 responses
    historyApiFallback: true,
  },
  module: {
    loaders: [
      {
        test:    /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader:  'elm-hot!elm-webpack?verbose=true&warn=true&debug=false'
      },
    ]
  },

  plugins: [
    new HtmlWebpackPlugin({
      template: 'src/static/index.html',
      inject: 'body',
      filename: 'index.html'
    }),
    new webpack.optimize.OccurenceOrderPlugin(),
    new webpack.optimize.UglifyJsPlugin({
        minimize:   true,
        compressor: { warnings: false }
        // mangle:  true
    })
  ]
}
