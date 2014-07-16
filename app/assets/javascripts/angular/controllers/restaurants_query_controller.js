app.controller('RestaurantsQueryController', ['$scope', 'Category', 'RestaurantsQuery', '$rootScope', '$modalInstance',
    function ($scope, Category, RestaurantsQuery, $rootScope, $modalInstance) {
        $scope.categories = Category.query();
        $scope.query = {
            only: [],
            except: [],
            location: "",
            distance: 5,
            tried: false,
            no_filter: false
        };
        $scope.RestaurantsQuery = RestaurantsQuery;
        $scope.loggedIn = $rootScope.User.isAuthenticated();
        $scope.submitQuery = function () {
            $scope.RestaurantsQuery.search($scope.query);
            $modalInstance.close();
        };
    }]);