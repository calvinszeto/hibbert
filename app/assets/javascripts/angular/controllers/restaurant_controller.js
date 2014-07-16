app.controller('RestaurantController', ['$scope', '$modalInstance', 'restaurant',
    function ($scope, $modalInstance, restaurant) {
        $scope.restaurant = restaurant;

        $scope.showSource = function () {
            $modalInstance.close();
        };
    }]);