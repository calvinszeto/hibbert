app.controller('SourcesController', ['$scope', 'Source', 'SourcesQuery',
    function ($scope, Source, SourcesQuery) {
        $scope.SourcesQuery = SourcesQuery;

        $scope.showSource = function (source) {
            console.log(source);
        };
        // Fill out the following when the User service is done
//        $scope.updateNoShow = function (source) {
//
//        };
//        $scope.updateTried = function (source) {
//
//        };
    }]);
