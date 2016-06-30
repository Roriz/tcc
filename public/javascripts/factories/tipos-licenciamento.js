var app = angular.module('licagro');

app.factory('TiposLicenciamento', function(DefaultORM) {
  return _.extend(DefaultORM('tipos_licenciamento'), {});
});