app.controller('UserController', ['$scope', '$rootScope', function ($scope, $rootScope) {
    $scope.User = $rootScope.User;
    $scope.user = {login: "", password: "", loggedIn: false};
    $scope.User.currentUser().success(function (result) {
        $scope.user = result;
        $scope.user.loggedIn = true;
    });

    $scope.user.register = false;
    $scope.showRegister = function () {
        $scope.user.register = true;
    };

    $scope.login = function () {
        $scope.authError = null;

        $scope.User.login($scope.user.login, $scope.user.password)
            .then(function (response) {
                if (!response) {
                    $scope.authError = 'Credentials are not valid';
                } else {
                    $scope.authError = 'Success!';
                    $scope.user.loggedIn = true;
                }
            }, function (response) {
                $scope.authError = 'Server offline, please try later';
            });
    };

    $scope.logout = function () {
        $scope.User.logout().then(function () {
            $scope.user = {login: "", password: "", loggedIn: false};
        });
    };

    $scope.register = function (user) {
        $scope.authError = null;

        $scope.User.register($scope.user.username, $scope.user.email,
            $scope.user.password, $scope.user.confirm_password)
            .then(function (response) {
                $scope.user.register = false;
                $scope.user.loggedIn = true;
            }, function (response) {
                var errors = '';
                $.each(response.data.errors, function (index, value) {
                    errors += index.substr(0, 1).toUpperCase() + index.substr(1) + ' ' + value + ''
                });
                $scope.authError = errors;
            });
    };
}
]);
