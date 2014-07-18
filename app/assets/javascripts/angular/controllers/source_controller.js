app.controller('SourceController', ['$scope', '$rootScope', 'Source', 'source', '$modalInstance',
    function ($scope, $rootScope, Source, source, $modalInstance) {
        $scope.source = Source.get({sourceId: source.id});
        $scope.loggedIn = $rootScope.User.isAuthenticated();

        $scope.showGroup = function() {
            $modalInstance.close();
        }

        $scope.closeWindow = function() {
            $modalInstance.close();
        }

        $scope.updateNoShow = function() {
            var operation = source.no_show ? "add" : "remove";
            $rootScope.User.updatePreferences({operation: operation, no_show_source: source.id});
            SourcesQuery.refresh = true;
        }
    }]);
