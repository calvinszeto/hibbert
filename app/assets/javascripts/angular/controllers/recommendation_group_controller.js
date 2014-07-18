app.controller('RecommendationGroupController', ['$scope', '$modalInstance', 'RecommendationGroup', 'group',
    function ($scope, $modalInstance, RecommendationGroup, group) {
        $scope.group = RecommendationGroup.get({groupId: group.id});

        $scope.hasNoShow = function () {
            return group.recommendations && group.recommendations[0].hasOwnProperty("no_show_restaurant");
        }

        $scope.hasTried = function () {
            return group.recommendations && group.recommendations[0].hasOwnProperty("tried_restaurant");
        }

        $scope.showSource = function () {
            $modalInstance.close();
        }

        $scope.showRestaurant = function () {
            $modalInstance.close();
        }

        $scope.closeWindow = function () {
            $modalInstance.close();
        }
    }]);