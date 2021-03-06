app.controller('RestaurantsController', ['TEMPLATES', '$scope', '$routeParams', '$location', '$modal', 'Restaurant', 'RestaurantsQuery',
    function (TEMPLATES, $scope, $routeParams, $location, $modal, Restaurant, RestaurantsQuery) {
        if (!!$routeParams.restaurantId) {
            Restaurant.get({restaurantId: $routeParams.restaurantId},
                function (data, status, headers, config) {
                    var modalInstance = $modal.open({
                        templateUrl: TEMPLATES.restaurant,
                        controller: "RestaurantController",
                        resolve: {
                            restaurant: function () {
                                return data;
                            }
                        }
                    });
                    modalInstance.result.then(function () {
                        // resolved - a link was clicked
                        if(RestaurantsQuery.refresh) {
                            RestaurantsQuery.search(true);
                            RestaurantsQuery.refresh = false;
                        }
                    }, function () {
                        // dismissed - go back to list
                        if(RestaurantsQuery.refresh) {
                            RestaurantsQuery.search(true);
                            RestaurantsQuery.refresh = false;
                        }
                        $location.path("/restaurants");
                    });
                }
                , error = function (data, status, headers, config) {
                    //TODO: add error alert
                });
        }
        $scope.RestaurantsQuery = RestaurantsQuery;
    }]);