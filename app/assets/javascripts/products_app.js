var app = angular.module("products",[]);

app.controller("ProductsController", [
          "$scope","$http",
  function($scope , $http) {
    $scope.products = [];
    $scope.search = function(search) {
      $http.get("/products.json",
                { "params": { "search": search } }
      ).then(function(response) {
          $scope.products = response.data;
      },function(response) {
          alert("There was a problem: " + response.status);
        }
      );
    }
  }
]);
                   
