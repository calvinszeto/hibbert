app.directive('sourceCards', [function () {
    return {
        restrict: "E",
        scope: {
            sources: "="
        },
        replace: true,
        template: '<ul class="cards-list">' +
            '<source-card ng-repeat="source in sources" index="{{$index}}" source="source"></source-card>' +
            '</ul>'
    };
}]);
