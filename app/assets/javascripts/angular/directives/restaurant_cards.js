app.directive('restaurantCards', [function () {
    var controller = function($element, $animate, $timeout) {
        this.toggleRestaurant = function(restaurant, expandedElement) {
            if(!expandedElement.hasClass("expanded")) {
                $element.removeClass("cards-list");
                $element.addClass("cards-show");
                $animate.addClass(expandedElement, "expanded");
                // TODO: Hardcoded numbers: animation duration
                $timeout(function() {
                    $element.addClass("hide-removed");
                }, 200);
            } else {
                $animate.removeClass(expandedElement, "expanded");
                $element.removeClass("cards-show");
                $element.removeClass("hide-removed");
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
            '<restaurant-card ng-repeat="restaurant in restaurants" index="{{$index}}" restaurant="restaurant"></restaurant-card>' +
            '</ul>'
    };
}]);