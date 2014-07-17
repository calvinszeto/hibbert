//This service is for sharing the queried sources between the filters modal and the sources browser
app.factory('SourcesQuery', ['Source', function (Source) {
    var SourcesQuery = {
        query: {
            location: "",
            distance: 5,
            no_filter: false
        },
        filters: {
            hasNoShow: false,
            hasDistance: false
        },
        sources: Source.query(),
        search: function () {
            SourcesQuery.sources = Source.query(SourcesQuery.query,
                function (data, status, headers, config) {
                    if (!!data) {
                        SourcesQuery.filters.hasDistance = data[0].hasOwnProperty("distance");
                        SourcesQuery.filters.hasNoShow = data[0].hasOwnProperty("no_show");
                    }
                });
        },
        // Set refresh to true if you want to delay refreshing the query, e.g. until after closing a modal
        refresh: false
    };

    return SourcesQuery;
}]);
