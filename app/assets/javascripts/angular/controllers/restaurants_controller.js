app.controller('RestaurantsController', ['$scope', 'Restaurant', 'RestaurantsQuery',
    function ($scope, Restaurant, RestaurantsQuery) {
        $scope.restaurants = RestaurantsQuery.restaurants;
        $scope.hasUserPreferences = RestaurantsQuery.hasUserPreferences;
        $scope.hasDistance = RestaurantsQuery.hasDistance;

        // Fill out the following when the User service is done
//        $scope.updateNoShow = function (restaurant) {
//
//        };
//        $scope.updateTried = function (restaurant) {
//
//        };
    }]);