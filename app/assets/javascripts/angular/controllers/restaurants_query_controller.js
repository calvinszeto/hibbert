app.controller('RestaurantsQueryController', ['$scope', 'Category', 'RestaurantsQuery', '$rootScope',
    function ($scope, Category, RestaurantsQuery, $rootScope) {
        $scope.categories = Category.query();
        $scope.query = {
            onlyCategories: [],
            exceptCategories: [],
            searchLocation: "",
            distance: 5
        };
        $scope.RestaurantsQuery = RestaurantsQuery;
        $scope.loggedIn = $rootScope.User.isAuthenticated();
        $scope.submitQuery = function () {
            $scope.RestaurantsQuery.search($scope.query);
        };
    }]);