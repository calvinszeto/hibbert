app.factory('Restaurant', ['HIBBERT_URL', '$resource', function (HIBBERT_URL, $resource) {
    var Restaurant = $resource(HIBBERT_URL + 'restaurants/:restaurantId.json', {restaurantId: '@id'});

    return Restaurant;
}]);