/**
 * Created by Varun on 10/29/2015.
 */
angular.module('cartApp', [])
    .controller('CartRefreshController', function ($scope,$http) {

        //cart.getItems = function () {
        $http({method: 'GET', url: '/getCart'}).success(function(data)
        {
            $scope.cartData=data; // response data
            console.log($scope.cartData);
        });
        console.log($scope.cartData);
       // };
    });