//This service is for sharing the queried restaurants between the filters modal and the restaurants browser
app.factory('RestaurantsQuery', ['Restaurant', function (Restaurant) {
    var RestaurantsQuery = {
        restaurants: Restaurant.query(),
        search: function (filters) {
            RestaurantsQuery.restaurants = Restaurant.query(filters,
                function (data, status, headers, config) {
                    if (data && data[0].hasOwnProperty("distance")) {
                        RestaurantsQuery.hasDistance = true;
                    }
                });
        },
        hasTried: false,
        hasNoShow: false,
        hasDistance: false
    };

    return RestaurantsQuery;
}]);