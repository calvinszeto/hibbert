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
        filters: {
            hasTried: false,
            hasNoShow: false,
            hasDistance: false
        },
        restaurants: Restaurant.query(),
        search: function () {
            RestaurantsQuery.restaurants = Restaurant.query(RestaurantsQuery.query,
                function (data, status, headers, config) {
                    if (!!data) {
                        RestaurantsQuery.filters.hasDistance = data[0].hasOwnProperty("distance");
                        RestaurantsQuery.filters.hasNoShow = data[0].hasOwnProperty("no_show");
                        RestaurantsQuery.filters.hasTried = data[0].hasOwnProperty("tried");
                        console.log(RestaurantsQuery.filters);
                    }
                });
        },
        // Set refresh to true if you want to delay refreshing the query, e.g. until after closing a modal
        refresh: false
    };

    return RestaurantsQuery;
}]);