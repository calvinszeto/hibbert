app.factory('RecommendationGroup', ['HIBBERT_URL', '$resource', function (HIBBERT_URL, $resource) {
    var RecommendationGroup = $resource(HIBBERT_URL + 'recommendation_groups/:groupId.json', {groupId: '@id'});

    return RecommendationGroup;
}]);