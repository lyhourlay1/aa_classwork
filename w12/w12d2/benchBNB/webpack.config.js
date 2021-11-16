const path = require('path');

module.exports = {
    // this is the path to the start of the program (e.g. main.js, or main.jsx)
    entry: './frontend/bench_bnb', // TODO: change file path


    output: {
        // When using webpack where to output the bundle.js
        // this outputs to ./bundle.js in the root folder
        path: path.resolve(__dirname, 'app', 'assets', 'javascripts'),  // TODO: keep or change output path
        filename: 'bundle.js'
    },

    // A source map makes it possible for you to see the line numbers of
    // your original source code when errors are raised.
    devtool: 'source-map',
    resolve: {
        // lets you specify what file extensions to process without explicitly naming them.
        // These are the extensions we will be primarily using
        // * - anything that we specifically specify
        // You must include the star matcher '*' to be able to include files with an explicit extension.
        // allows imports like: import funcName from './path/to/file
        // without needing the './path/to/file.js'
        extensions: [".js", ".jsx", "*"]
    },
    module: {
        rules: [
            {
                test: /\.jsx?$/,
                exclude: /(node_modules)/,
                use: {
                    loader: 'babel-loader',
                    options: {
                        presets: ['@babel/env', '@babel/react']
                    }
                }
            },
            {
                test: /\.css$/,
                use: ['style-loader', 'css-loader']
            }
        ]
    }
};