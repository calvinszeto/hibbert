var app = angular.module("hibbertApp", [
    'ngAnimate',
    'ngResource',
    'ngRoute',
    'ngMock',
    'mm.foundation',
    'ui.select2',
    'infinite-scroll'
])
    .config(['$httpProvider', function ($httpProvider) {
        $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
    }])
    .run([ '$rootScope', '$location', function ($rootScope, $location) {
        $rootScope.location = $location;
    }])
    .run([ '$rootScope', 'User', function ($rootScope, User) {
        $rootScope.User = User;
    }]);
