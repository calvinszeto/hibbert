app.controller('RestaurantsQueryController', ['$scope', 'Category', 'RestaurantsQuery',
    function ($scope, Category, RestaurantsQuery) {
        $scope.categories = Category.query();
        $scope.query = {
            onlyCategories: [],
            exceptCategories: [],
            searchLocation: "",
            distance: 5
        };
        $scope.RestaurantsQuery = RestaurantsQuery;
        // If logged in
        // Tried
        // No Show
        $scope.submitQuery = function () {
            $scope.RestaurantsQuery.search($scope.query);
        };
    }]);