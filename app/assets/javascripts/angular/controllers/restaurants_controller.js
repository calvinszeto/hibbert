app.controller('RestaurantsController', ['$scope', 'Restaurant', 'RestaurantsQuery',
    function ($scope, Restaurant, RestaurantsQuery) {
        $scope.RestaurantsQuery = RestaurantsQuery;

        $scope.showRestaurant = function (restaurant) {
            console.log(restaurant);
        };
        // Fill out the following when the User service is done
//        $scope.updateNoShow = function (restaurant) {
//
//        };
//        $scope.updateTried = function (restaurant) {
//
//        };
    }]);