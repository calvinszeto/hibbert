app.controller('RecommendationGroupController', ['$scope', '$modalInstance', 'group',
    function($scope, $modalInstance, group) {
        $scope.group = group;

        $scope.showRestaurant = function() {
            $modalInstance.close();
        }
}]);