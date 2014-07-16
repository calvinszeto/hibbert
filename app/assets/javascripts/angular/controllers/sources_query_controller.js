app.controller('SourcesQueryController', ['$scope', 'Category', 'SourcesQuery', '$rootScope', '$modalInstance',
    function ($scope, Category, SourcesQuery, $rootScope, $modalInstance) {
        $scope.categories = Category.query();
        $scope.query = {
            location: "",
            distance: 5,
            no_filter: false
        };
        $scope.SourcesQuery = SourcesQuery;
        $scope.loggedIn = $rootScope.User.isAuthenticated();
        $scope.submitQuery = function () {
            $scope.SourcesQuery.search($scope.query);
            $modalInstance.close();
        };
    }]);
