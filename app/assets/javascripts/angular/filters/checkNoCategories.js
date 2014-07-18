app.filter('checkNoCategories', [function() {
    return function(input) {
        return input ? input : "Not categorized yet!";
    };
}]);