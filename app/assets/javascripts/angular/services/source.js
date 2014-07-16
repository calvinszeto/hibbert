app.factory('Source', ['HIBBERT_URL', '$resource', function(HIBBERT_URL, $resource) {
    var Source = $resource(HIBBERT_URL + 'sources/:sourceId.json', {sourceId: '@id'});

    return Source;
}]);