app.filter('numberToSources', [function() {
    return function(input) {
        return input === 1 ? input.toString() + " source" : input.toString() + " sources";
    };
}]);