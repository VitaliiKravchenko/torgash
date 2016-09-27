var app = angular.module("products",[]).config(function($sceProvider) {
  $sceProvider.enabled(false);
});

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
    $scope.searchedFor = search;
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

app.directive('magnificImage', magnificImageDirective);

function maginificImageDirective() {
    return {
        restrict: 'A',
        link: function (scope, iElement) {
            scope.$evalAsync(function () {
                iElement.magnificPopup({
                    // ... magnific options
                      type: 'image',
                      closeOnContentClick: true,
                      mainClass: 'mfp-img-mobile',
                      image: {
                              verticalFit: true
                             } 
                });
            });
        }
    };
};
/*
angular.module().directive('magnificPopup',
    [
        "$compile", 
        function($compile) {
            return {
                restrict: 'A',
                scope: {},
                link: function($scope, element, attr) {
                    attr.callbacks = {
                        ajaxContentAdded: function() {
                            var content = this.content;
    
                            var scope =  content.scope();
                            $compile(content)(scope);
                            scope.$digest();
                        }
                    };
    
                    element.magnificPopup(attr);
                }
            }
        }
    ]
);
*/
                   
