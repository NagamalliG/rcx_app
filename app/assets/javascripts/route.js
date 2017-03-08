var app = angular.module("app", []);
app.config([
    "$httpProvider",
    function($httpProvider) {
        $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
    }
]);
app.controller("controller", function($scope, $http) {
    $scope.countries = [];
    $scope.states = [];
    $scope.cities = [];
    $scope.names = [];
    $scope.country;
    $scope.state;
    $scope.city;
    $scope.GetSelectedCountry = function() {
        if ($scope.country) {
            $scope.states = $scope.country.States;
            $scope.state = '';
            $scope.cities = [];
        } else {
            $scope.states = [];
        }
    };
    $scope.GetSelectedState = function() {
        if ($scope.state) {
            $scope.cities = $scope.state.cities;
            $scope.city = '';
        } else {
            $scope.cities = [];
        }
    };
    //$scope.countries = gon.your_variable
    $scope.programs = '';
    $scope.GetSelectedTier = function() {
        $scope.selectedTier = $scope.tier
        $http({
            url: '/getTiers',
            method: 'POST',
            data: { 'tier': $scope.tier }
        }).then(function successCallback(response) {
            $scope.programs = response.data;
            console.log(response.data[0].programs);
        }, function errorCallback(response) {});
    };
    $scope.getDataFromRCXApp = function() {
        alert('button clicked..');
        var url = 'https://nameless-escarpment-97840.herokuapp.com/programs';
        $http.get(url).success(function(data) {
            console.log('data:=' + JSON.stringify(data));
            alert('button.  .' + JSON.stringify(data));
        }).error(function(err) {
            alert('button..' + JSON.stringify(err));
            console.log(JSON.stringify(err));
        });
    };
    //$scope.countries = [{ "_id": 1, "name": "India", "States": [{ "id": 1, "name": "Maharashtra", "cities": ["Pune", "Mumbai", "Nagpur", "Akola"] }, { "id": 2, "name": "Madhya Pradesh", "cities": ["Indore", "Bhopal", "Jabalpur"] }, { "id": 3, "name": "Rajasthan", "cities": ["Jaipur", "Ajmer", "Jodhpur"] }] }, { "_id": 2, "name": "USA", "States": [{ "id": 1, "name": "Alabama", "cities": ["Montgomery", "Birmingham"] }, { "id": 2, "name": "California", "cities": ["Sacramento", "Fremont"] }, { "id": 3, "name": "Illinois", "cities": ["Springfield", "Chicago"] }] }, { "_id": 3, "name": "Australia", "States": [{ "id": 1, "name": "New South Wales", "cities": ["Sydney"] }, { "id": 2, "name": "Victoria", "cities": ["Melbourne"] }] }];
});