app.factory('Category', ['HIBBERT_URL', '$resource', function(HIBBERT_URL, $resource) {
    var Category = $resource(HIBBERT_URL + 'categories.json');

    return Category;
}]);