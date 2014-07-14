app.controller('UserController', ['$scope', '$rootScope', function ($scope, $rootScope) {
    $scope.User = $rootScope.User;
    $scope.user = {email: "", password: "", logged_in: false};
    $scope.User.currentUser().then(function (result) {
        $scope.user = result;
        $scope.user.logged_in = true;
    });

    $scope.login = function () {
        $scope.authError = null;

        $scope.User.login($scope.user.email, $scope.user.password)
            .then(function (response) {
                if (!response) {
                    $scope.authError = 'Credentials are not valid';
                } else {
                    $scope.authError = 'Success!';
                    $scope.user.logged_in = true;
                }
            }, function (response) {
                $scope.authError = 'Server offline, please try later';
            });
    };

    $scope.logout = function () {
        $scope.User.logout().then(function() {
            $scope.user = {email: "", password: "", logged_in: false};
        });
    };

    $scope.register = function (user) {
        $scope.authError = null;

        $scope.session.register(user.email, user.password, user.confirm_password)
            .then(function (response) {
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
