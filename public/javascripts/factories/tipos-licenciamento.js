var app = angular.module('licagro');

app.factory('TiposLicenciamento', function(DefaultORM) {
  return function() {
    var self = this;
    self = _.extend(self, DefaultORM('tipos_licenciamento'));
  };
});