app.controller('SourceController', ['$scope', 'Source', 'source',
    function ($scope, Source, source) {
        $scope.source = Source.get({sourceId: source.id});

        $scope.showGroup = function() {
            $modalInstance.close();
        }
    }]);
