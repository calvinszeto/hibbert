app.factory('User', ['$q', '$http',
    function ($q, $http) {
        var User = {
            _currentUser: null,
            currentUser: function () {
                if (User.isAuthenticated()) {
                    return $q.when(User._currentUser);
                } else {
                    return $http.get('/users.json').success(function (data, status, headers, config) {
                        User._currentUser = data;
                        return User._currentUser;
                    });
                }
            },
            login: function (login, password) {
                return $http.post('/sessions.json', {user: {login: login, password: password} })
                    .then(function (response) {
                        User._currentUser = response.data.user;
                        return response;
                    });
            },
            logout: function () {
                return $http.delete('/sessions.json').then(function (response) {
                    $http.defaults.headers.common['X-CSRF-Token'] = response.data.csrfToken;
                    User._currentUser = null;
                });
            },
            register: function (username, email, password, password_confirmation) {
                User._currentUser = $http.post('/users.json', { user: {
                    username: username,
                    email: email,
                    password: password,
                    password_confirmation: password_confirmation
                }}).then(function (response) {
                    User._currentUser = response.data.user;
                    return response;
                });
                return User._currentUser;
            },
            updatePreferences: function(options) {
                return $http.put('/users.json', options);
            },
            isAuthenticated: function () {
                return !!User._currentUser;
            }
        };

        return User;
    }]);