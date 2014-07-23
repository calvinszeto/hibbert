// The following provides the root path and current angular path to our templates
angular.module('constants', [])
    .constant('HIBBERT_URL', "http://localhost:9876")
    // The following contains the Rails-generated asset paths for all Angular templates
    .constant('TEMPLATES',
    {
        "nav": "app/assets/templates/nav.html",
        "recommendation_group": "app/assets/templates/recommendation_group.html",
        "restaurant": "app/assets/templates/restaurant.html",
        "restaurant_card": "app/assets/templates/restaurant_card.html",
        "restaurants": "app/assets/templates/restaurants.html",
        "restaurants_query": "app/assets/templates/restaurants_query.html",
        "source": "app/assets/templates/source.html",
        "source_card": "app/assets/templates/source_card.html",
        "sources": "app/assets/templates/sources.html",
        "sources_query": "app/assets/templates/sources_query.html",
        "user": "app/assets/templates/user.html"
    });
