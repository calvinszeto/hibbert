//This service is for sharing the queried sources between the filters modal and the sources browser
app.factory('SourcesQuery', ['Source', function (Source) {
    var SourcesQuery = {
        sources: Source.query(),
        search: function (filters) {
            SourcesQuery.sources = Source.query(filters,
                function (data, status, headers, config) {
                    if (data && data[0].hasOwnProperty("distance")) {
                        SourcesQuery.hasDistance = true;
                    }
                });
        },
        hasNoShow: false,
        hasDistance: false
    };

    return SourcesQuery;
}]);
