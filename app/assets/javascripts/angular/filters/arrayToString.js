app.filter('arrayToString', [function() {
    return function(input) {
        return input.join(", ");
    }
}]);