app.controller('SourcesController', ['TEMPLATES', '$scope', '$routeParams', '$location', '$modal', 'Source', 'SourcesQuery', 'RecommendationGroup',
    function (TEMPLATES, $scope, $routeParams, $location, $modal, Source, SourcesQuery, RecommendationGroup) {
        if (!!$routeParams.sourceId) {
            Source.get({sourceId: $routeParams.sourceId},
                function (data, status, headers, config) {
                    var modalInstance = $modal.open({
                        templateUrl: TEMPLATES.source,
                        controller: "SourceController",
                        resolve: {
                            source: function () {
                                return data;
                            }
                        }
                    });
                    modalInstance.result.then(function () {
                        // resolved - a link was clicked
                        if (SourcesQuery.refresh) {
                            SourcesQuery.search();
                            SourcesQuery.refresh = false;
                        }
                    }, function () {
                        // dismissed - go back to list
                        if (SourcesQuery.refresh) {
                            SourcesQuery.search();
                            SourcesQuery.refresh = false;
                        }
                        $location.path("/sources");
                    });
                }
                , error = function (data, status, headers, config) {
                    //TODO: add error alert
                });
        } else if (!!$routeParams.groupId) {
            RecommendationGroup.get({groupId: $routeParams.groupId},
                function (data, status, headers, config) {
                    var modalInstance = $modal.open({
                        templateUrl: TEMPLATES.recommendation_group,
                        controller: "RecommendationGroupController",
                        resolve: {
                            group: function () {
                                return data;
                            }
                        }
                    });
                    modalInstance.result.then(function () {
                        // resolved - a link was clicked
                    }, function () {
                        // dismissed - go back to list
                        $location.path("/sources");
                    });
                }
                , error = function (data, status, headers, config) {
                    //TODO: add error alert
                });
        }

        $scope.SourcesQuery = SourcesQuery;
    }]);
