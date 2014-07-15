app.directive('restaurantCards', [function () {
    return {
        restrict: "E",
        scope: {
            restaurants: "="
        },
        replace: true,
        template: '<ul class="cards-list">' +
            '<restaurant-card ng-repeat="restaurant in restaurants" index="{{$index}}" restaurant="restaurant"></restaurant-card>' +
            '</ul>'
    };
}]);