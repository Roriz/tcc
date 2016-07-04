var app = angular.module('licagro');

app.factory('DestinoEfluente', function(DefaultORM) {
  return function() {
    var self = this;
    self = _.extend(self, DefaultORM('td_destino_efluente'));
  };
});