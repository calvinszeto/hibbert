app.controller('RestaurantsQueryController', ['$scope', 'Category', 'RestaurantsQuery', '$rootScope', '$modalInstance',
    function ($scope, Category, RestaurantsQuery, $rootScope, $modalInstance) {
        $scope.categories = Category.query();
        $scope.RestaurantsQuery = RestaurantsQuery;
        $scope.query = RestaurantsQuery.query;
        $scope.loggedIn = $rootScope.User.isAuthenticated();
        $scope.submitQuery = function () {
            $scope.RestaurantsQuery.search();
            $modalInstance.close();
        };
    }]);