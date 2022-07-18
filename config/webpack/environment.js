const { environment } = require('@rails/webpacker')

const webpack = require('webpack');

environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery'
    })
)

environment.toWebpackConfig().merge({
    resolve: {
    alias: {
    'jquery': 'jquery/src/jquery',
    'jquery-ui-css': 'jquery-ui/../../themes/base'
    }
    }
    });

module.exports = environment;
