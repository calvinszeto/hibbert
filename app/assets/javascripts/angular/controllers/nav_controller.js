app.controller('NavCtrl', [ 'HIBBERT_URL', 'TEMPLATES', '$scope', '$location', '$modal', 'Alert',
    function (HIBBERT_URL, TEMPLATES, $scope, $location, $modal, Alert) {
        $scope.alert = Alert;
        $scope.closeAlert = function(index) {
            $scope.alert.alerts.splice(index, 1);
        }

        // Variables for holding the recent path so the regexes aren't being executed constantly
        var restaurantPath = {
            previousPath: null,
            previousDecision: false
        };
        var sourcePath = {
            previousPath: null,
            previousDecision: false
        };

        $scope.showingRestaurants = function () {
            if ($location.path() != restaurantPath.previousPath) {
                restaurantPath.previousPath = $location.path();
                restaurantPath.previousDecision = /\/restaurants*/.exec($location.path());
            }
            return restaurantPath.previousDecision;
        };

        $scope.showingSources = function () {
            if ($location.path() != sourcePath.previousPath) {
                sourcePath.previousPath = $location.path();
                sourcePath.previousDecision = /\/sources*/.exec($location.path());
            }
            return sourcePath.previousDecision;
        };

        $scope.openRestaurantsQuery = function () {
            if ($location.path() === "/restaurants") {
                $modalInstance = $modal.open({
                    templateUrl: TEMPLATES.restaurants_query,
                    controller: 'RestaurantsQueryController'
                });
            }
        };

        $scope.openSourcesQuery = function () {
            if ($location.path() === "/sources") {
                $modalInstance = $modal.open({
                    templateUrl: TEMPLATES.sources_query,
                    controller: 'SourcesQueryController'
                });
            }
        };
    }])
;