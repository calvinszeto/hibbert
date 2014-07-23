app.directive('sourceCard', ['TEMPLATES', '$modal', '$location', 'SourcesQuery',
    function (TEMPLATES, $modal, $location, SourcesQuery) {
        function link(scope, element, attrs) {
            scope.filters = SourcesQuery.filters;
            scope.openSource = function (source) {
                $location.path("/sources/" + source.id);
            }
        };
        return {
            restrict: "E",
            scope: {
                source: '=',
                index: '@'
            },
            replace: true,
            templateUrl: TEMPLATES.source_card,
            link: link
        }
    }]);
