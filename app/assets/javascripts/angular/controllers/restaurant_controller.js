app.controller('RestaurantController', ['$scope', '$modalInstance', '$rootScope', 'restaurant', 'RestaurantsQuery',
    function ($scope, $modalInstance, $rootScope, restaurant, RestaurantsQuery) {
        $scope.restaurant = restaurant;
        $scope.refresh = false;

        $scope.showSource = function () {
            $modalInstance.close();
        };

        $scope.closeWindow = function() {
            $modalInstance.close();
        }

        $scope.updateNoShow = function () {
            var operation = restaurant.no_show ? "add" : "remove";
            $rootScope.User.updatePreferences({operation: operation, no_show_restaurant: restaurant.id});
            RestaurantsQuery.refresh = true;
        };

        $scope.updateTried = function () {
            var operation = restaurant.tried ? "add" : "remove";
            $rootScope.User.updatePreferences({operation: operation, tried_restaurant: restaurant.id});
            RestaurantsQuery.refresh = true;
        };
    }]);