//This service is for sharing the queried restaurants between the filters modal and the restaurants browser
app.factory('RestaurantsQuery', ['Restaurant', function (Restaurant) {
    return {restaurants: Restaurant.query(),
        hasPreferences: false,
        hasDistance: false};
}]);