// Karma configuration
// Generated on Tue Jul 22 2014 21:49:39 GMT-0500 (CDT)

module.exports = function (config) {
    config.set({

        // base path that will be used to resolve all patterns (eg. files, exclude)
        basePath: '',


        // frameworks to use
        // available frameworks: https://npmjs.org/browse/keyword/karma-adapter
        frameworks: ['jasmine'],


        // list of files / patterns to load in the browser
        files: [
            'vendor/assets/bower_components/jquery/dist/jquery.js',
            'vendor/assets/bower_components/angular/angular.js',
            'vendor/assets/bower_components/angular-animate/angular-animate.js',
            'vendor/assets/bower_components/angular-foundation/mm-foundation.js',
            'vendor/assets/bower_components/angular-mocks/angular-mocks.js',
            'vendor/assets/bower_components/angular-resource/angular-resource.js',
            'vendor/assets/bower_components/angular-route/angular-route.js',
            'vendor/assets/bower_components/select2/select2.js',
            'vendor/assets/bower_components/angular-ui-select2/src/select2.js',
            'vendor/assets/bower_components/ngInfiniteScroll/build/ng-infinite-scroll.js',
            'app/assets/javascripts/angular/**/*.js',
            'spec/javascripts/**/*.js'
        ],


        // list of files to exclude
        exclude: [
        ],


        // preprocess matching files before serving them to the browser
        // available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
        preprocessors: {
        },


        // test results reporter to use
        // possible values: 'dots', 'progress'
        // available reporters: https://npmjs.org/browse/keyword/karma-reporter
        reporters: ['progress'],


        // web server port
        port: 9876,


        // enable / disable colors in the output (reporters and logs)
        colors: true,


        // level of logging
        // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
        logLevel: config.LOG_INFO,


        // enable / disable watching file and executing tests whenever any file changes
        autoWatch: false,


        // start these browsers
        // available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
        browsers: ['Chrome', 'Firefox'],


        // Continuous Integration mode
        // if true, Karma captures browsers, runs the tests and exits
        singleRun: false
    });
};
