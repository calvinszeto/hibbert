app.config(['$routeProvider', 'TEMPLATES', function($routeProvider, TEMPLATES) {
    $routeProvider
        .when('/restaurants/:restaurantId?', {
            templateUrl: TEMPLATES.restaurants,
            controller: 'RestaurantsController'
        })
        .when('/sources/:sourceId?', {
            templateUrl: TEMPLATES.sources,
            controller: 'SourcesController'
        })
        .when('/sources/group/:groupId', {
            templateUrl: TEMPLATES.sources,
            controller: 'SourcesController'
        })
        .otherwise({
            redirectTo: '/restaurants'
        });
}]);