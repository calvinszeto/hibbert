app.controller('RestaurantController', ['$scope', '$modalInstance', '$rootScope', 'restaurant',
    function ($scope, $modalInstance, $rootScope, restaurant) {
        $scope.restaurant = restaurant;

        $scope.showSource = function () {
            $modalInstance.close();
        };

        $scope.updateNoShow = function () {
            var operation = restaurant.no_show ? "add" : "remove";
            $rootScope.User.updatePreferences({operation: operation, no_show_restaurant: restaurant.id});
        };

        $scope.updateTried = function () {
            var operation = restaurant.tried ? "add" : "remove";
            $rootScope.User.updatePreferences({operation: operation, tried_restaurant: restaurant.id});
        };
    }]);