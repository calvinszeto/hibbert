app.controller('RestaurantController', ['Restaurant', function (Restaurant) {
    var restaurants = [];
    restaurants = Restaurant.query();
}]);