var app = angular.module('licagro');

app.factory('AbastecimentoAgua', function(DefaultORM) {
  return function() {
    var self = this;
    self = _.extend(self, DefaultORM('td_abastecimento_agua'));
  };
});