app.controller('RestaurantsController', ['$scope', 'Restaurant',
    function ($scope, Restaurant) {
    $scope.hasUserPreferences = false;
    $scope.hasDistance = false;
    $scope.restaurants = Restaurant.query();
}]);