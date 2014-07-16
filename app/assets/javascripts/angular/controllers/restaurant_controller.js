app.controller('RestaurantController', ['$scope', 'Restaurant', 'restaurant',
    function($scope, Restaurant, restaurant) {
    $scope.restaurant = Restaurant.get({restaurantId: restaurant.id});
}]);