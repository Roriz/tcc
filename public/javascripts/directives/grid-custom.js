angular.module('licagro').directive("gridCustom", function() {
  return {
    restrict: 'A',
    scope: {
      datasource: '=',
      ngClick: '&'
    },
    templateUrl: function(elem, attr) {
      return "/javascripts/views/layout/data-grid.html";
    },
    controller: ['$scope',
      function($scope) {

        $scope.delete = function(p1, p2) {
          if ($scope.$parent.delete && _.isFunction($scope.$parent.delete)) {
            $scope.$parent.delete(p1, p2, function() {
              $scope.gridOptions.api.setDatasource(dataSource);
            });
          }
        }


        $scope.gridOptions = {
          enableServerSideSorting: true,
          enableServerSideFilter: true,
          angularCompileRows: true,
          columnDefs: $scope.datasource.columnDefs
        };


        if (!$scope.datasource.buttons) {
          $scope.datasource.buttons = [];
        }
        if (!$scope.datasource.hasExport) {
          $scope.datasource.hasExport = true;
        }
        if (!$scope.datasource.hasSearch) {
          $scope.datasource.hasSearch = true;
        }
        if (!$scope.datasource.modelName) {
          $scope.datasource.modelName = false;
        }

        // Variables for export
        $scope.exportData = {
          columnDefs: $scope.datasource.columnDefs,
          currentData: false,
          model: $scope.datasource.modelName,
          currentQ: false,
          filters: ($scope.datasource.params && $scope.datasource.params.filters ? $scope.datasource.params.filters : {}),
          sortModel: false
        }

        $scope.paginate = {
          pageSize: 10,
          currentPage: 0,
          currentQ: false,
          currentTotalRows: false,
          totalRowsPerPage: false,
          canNexted: true,
          pages: [],
          nextPage: function() {
            this.currentPage = Math.min(Math.floor(this.currentTotalRows / this.pageSize), this.currentPage + 1);
            $scope.gridOptions.api.setDatasource(dataSource);
            $scope.gridOptions.refreshView();
          },
          previusPage: function() {
            this.currentPage = Math.max(0, this.currentPage - 1);
            $scope.gridOptions.api.setDatasource(dataSource);
          },
          goTo: function(value) {
            if (parseInt(value) || parseInt(value) === 0) {
              this.currentPage = parseInt(value);
              $scope.gridOptions.api.setDatasource(dataSource);
            }
          }
        }

        var alreadySetDefault = false;
        var fetching = false;
        var dataSource = {
          pageSize: $scope.paginate.pageSize,
          getRows: function(params) {
            var getRows = function() {
              fetching = setTimeout(function() {
                fetching = false;
              }, 300);


              if (alreadySetDefault === false && localStorage.getItem("collection") == $scope.datasource.modelName) {
                $scope.paginate.currentPage = parseInt(localStorage.getItem("currentPage"));
                $scope.paginate.currentQ = localStorage.getItem("quickFilterText");
                $scope.gridOptions.quickFilterText = localStorage.getItem("quickFilterText");
                params.q = localStorage.getItem("quickFilterText");
              } else {
                localStorage.setItem("currentPage", false);
                localStorage.setItem("quickFilterText", false);
                localStorage.setItem("collection", false);
              }
              alreadySetDefault = true;

              if ($scope.gridOptions.quickFilterText != $scope.paginate.currentQ) {
                $scope.paginate.currentPage = 0;
                $scope.exportData.currentQ = $scope.gridOptions.quickFilterText;
                $scope.paginate.currentQ = $scope.exportData.currentQ;
              }
              params.q = $scope.gridOptions.quickFilterText;
              $scope.exportData.sortModel = params.sortModel;
              params.startRow = $scope.paginate.currentPage * $scope.paginate.pageSize;
              params.endRow = ($scope.paginate.currentPage + 1) * $scope.paginate.pageSize;
              params.columnDefs = $scope.datasource.columnDefs;

              params = _.merge(($scope.datasource.params ? $scope.datasource.params : {}), params);

              var query = angular.toJson(params);
              new $scope.datasource.collection().paged(angular.fromJson(query), function(data) {
                $scope.exportData.currentData = data;
                params.successCallback($scope.exportData.currentData, ($scope.exportData.currentData.length ? $scope.exportData.currentData[0].totalrows : 0));

                $scope.paginate.currentTotalRows = ($scope.exportData.currentData[0] ? $scope.exportData.currentData[0].totalrows : 0);
                $scope.paginate.totalRowsPerPage = $scope.paginate.currentTotalRows / $scope.paginate.pageSize;
                $scope.paginate.canNexted = $scope.paginate.totalRowsPerPage <= $scope.paginate.currentPage + 1 ? false : true;
                $scope.paginate.pages = [];

                localStorage.setItem("currentPage", $scope.paginate.currentPage);
                localStorage.setItem("quickFilterText", params.q ? params.q : '');
                localStorage.setItem("collection", $scope.datasource.modelName);


                if ($scope.paginate.currentPage - 1 > 1) {
                  $scope.paginate.pages.push({
                    number: 1
                  });
                  $scope.paginate.pages.push({
                    number: '...'
                  });
                }
                var z = 0;
                for (var i = Math.max($scope.paginate.currentPage - 1, 1); i <= Math.ceil($scope.paginate.totalRowsPerPage); i++) {
                  if (z > 4) {
                    $scope.paginate.pages.push({
                      number: '...'
                    });
                    $scope.paginate.pages.push({
                      number: Math.ceil($scope.paginate.totalRowsPerPage)
                    });
                    i = Math.ceil($scope.paginate.totalRowsPerPage) + 1;
                  } else {
                    $scope.paginate.pages.push({
                      number: i
                    });
                  }
                  z++;
                }


              });
            }
            if (fetching === false) {
              getRows();
            } else {
              clearTimeout(fetching);
              fetching = setTimeout(function() {
                getRows();
              }, 300);
            }
          }
        };


        setTimeout(function() {
          $scope.gridOptions.api.setDatasource(dataSource);
          $scope.gridOptions.api.sizeColumnsToFit();
        }, 0);
      }
    ]
  };
})