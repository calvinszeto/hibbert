app.controller('RestaurantController', ['$scope', '$location', '$modalInstance', 'Restaurant', 'restaurant',
    function($scope, $location, $modalInstance, Restaurant, restaurant) {
    $scope.restaurant = restaurant;

    $scope.showSource = function(source) {
        $modalInstance.close();
    };
}]);