//This service is for sharing the queried restaurants between the filters modal and the restaurants browser
app.factory('RestaurantsQuery', ['Restaurant', function (Restaurant) {
    var RestaurantsQuery = {
        query: {
            only: [],
            except: [],
            location: "",
            distance: 5,
            tried: false,
            no_filter: false
        },
        restaurants: Restaurant.query(),
        search: function () {
            RestaurantsQuery.restaurants = Restaurant.query(RestaurantsQuery.query,
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