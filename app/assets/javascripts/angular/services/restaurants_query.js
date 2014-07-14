//This service is for sharing the queried restaurants between the filters modal and the restaurants browser
app.factory('RestaurantsQuery', ['Restaurant', function (Restaurant) {
    var RestaurantsQuery = {
        restaurants: Restaurant.query(),
        search: function (filters) {
            RestaurantsQuery.restaurants = Restaurant.query({
                location: "506 W 37. St. Austin, TX 78705"
            });
            RestaurantsQuery.hasDistance = true;
        },
        hasPreferences: false,
        hasDistance: false,
        test: ""
    };

    return RestaurantsQuery;
}]);