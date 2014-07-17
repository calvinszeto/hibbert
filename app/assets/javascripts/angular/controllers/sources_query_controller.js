app.controller('SourcesQueryController', ['$scope', 'Category', 'SourcesQuery', '$rootScope', '$modalInstance',
    function ($scope, Category, SourcesQuery, $rootScope, $modalInstance) {
        $scope.categories = Category.query();
        $scope.query = SourcesQuery.query;
        $scope.SourcesQuery = SourcesQuery;
        $scope.loggedIn = $rootScope.User.isAuthenticated();
        $scope.submitQuery = function () {
            $scope.SourcesQuery.search($scope.query);
            $modalInstance.close();
        };
    }]);
