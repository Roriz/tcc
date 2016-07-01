var app = angular.module('licagro');

app.factory('LicenciamentoStatus', function(DefaultORM) {
  return function() {
    var self = this;
    self = _.extend(self, DefaultORM('licenciamento_status'));
  };
});