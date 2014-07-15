app.directive('restaurantCards', [function () {
    var controller = function($element) {
        this.toggleRestaurant = function(restaurant, expandedElement, expanded) {
            if(expanded) {
                $element.removeClass("cards-list");
                $element.addClass("cards-show");
                expandedElement.addClass("expanded");
            } else {
                expandedElement.removeClass("expanded");
                $element.removeClass("cards-show");
                $element.addClass("cards-list");
            }
        }
    }

    return {
        controller: controller,
        restrict: "E",
        scope: {
            restaurants: "="
        },
        replace: true,
        template: '<ul class="cards-list">' +
            '<li ng-repeat="restaurant in restaurants">' +
            '<restaurant-card restaurant="restaurant"></restaurant-card>' +
            '</li></ul>'
    };
}]);