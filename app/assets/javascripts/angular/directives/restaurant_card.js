app.directive('restaurantCard', ['TEMPLATES', '$modal', '$location', 'RestaurantsQuery',
    function (TEMPLATES, $modal, $location, RestaurantsQuery) {
        function link(scope, element, attrs) {
            scope.filters = RestaurantsQuery.filters;
            scope.openRestaurant = function (restaurant) {
                $location.path("/restaurants/" + restaurant.id);
            }
        };
        return {
            restrict: "E",
            scope: {
                restaurant: '=',
                index: '@'
            },
            replace: true,
            templateUrl: TEMPLATES.restaurant_card,
            link: link
        }
    }
]);