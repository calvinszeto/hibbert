//This service is for sharing the queried restaurants between the filters modal and the restaurants browser
app.factory('RestaurantsQuery', ['Restaurant', function (Restaurant) {
    var RestaurantsQuery = {
        busy: false,
        query: {
            only: [],
            except: [],
            location: "",
            distance: 5,
            tried: false,
            no_filter: false,
            page: 0,
            per_page: 30
        },
        filters: {
            hasTried: false,
            hasNoShow: false,
            hasDistance: false
        },
        restaurants: [],
        search: function () {
            // Ignore query requests when one is still waiting
            if (RestaurantsQuery.busy) return;
            RestaurantsQuery.busy = true;
            // Reset current restaurants if asking for page 0
            if (RestaurantsQuery.query.page === 0) {
                RestaurantsQuery.restaurants = [];
            }
            Restaurant.query(RestaurantsQuery.query,
                function (data, status, headers, config) {
                    if (!!data.length) {
                        // Update the next page to be queried
                        RestaurantsQuery.query.page += 1;
                        // Update filters for search results type
                        RestaurantsQuery.filters.hasDistance = data[0].hasOwnProperty("distance");
                        RestaurantsQuery.filters.hasNoShow = data[0].hasOwnProperty("no_show");
                        RestaurantsQuery.filters.hasTried = data[0].hasOwnProperty("tried");
                    }
                    // Combine any new data with the old data unless either one is empty
                    if (!!RestaurantsQuery.restaurants.length && !!data.length) {
                        Array.prototype.push.apply(RestaurantsQuery.restaurants, data);
                    } else if (!!data.length) {
                        RestaurantsQuery.restaurants = data;
                    }
                    RestaurantsQuery.busy = false;
                });
        },
        // Set refresh to true if you want to delay refreshing the query, e.g. until after closing a modal
        refresh: false
    };
    return RestaurantsQuery;
}]);