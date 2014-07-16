app.controller('UserController', ['$scope', '$rootScope', function ($scope, $rootScope) {
    $scope.User = $rootScope.User;
    $scope.user = {email: "", password: "", loggedIn: false};
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

        $scope.User.login($scope.user.email, $scope.user.password)
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
            $scope.user = {email: "", password: "", loggedIn: false};
        });
    };

    $scope.register = function (user) {
        $scope.authError = null;

        $scope.User.register($scope.user.email,
            $scope.user.password, $scope.user.confirm_password)
            .then(function (response) {
                $scope.user.register = false;
                console.log(response);
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
