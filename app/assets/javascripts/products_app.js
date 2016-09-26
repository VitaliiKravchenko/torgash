var app = angular.module("products",[]);

/*app.controller("ProductsController", [
              "$scope",
  function($scope) {
    $scope.search = function(search) {
      $scope.searchedFor = search;
    }
  }
]);*/


app.controller("ProductsController", [
          "$scope","$http",
  function($scope , $http) {
    $scope.products = [];
    $scope.search = function(search) {
      if (search.length < 3) {
        return;
      }
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
                   
