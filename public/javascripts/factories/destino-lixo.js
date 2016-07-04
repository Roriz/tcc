var app = angular.module('licagro');

app.factory('DestinoLixo', function(DefaultORM) {
  return function() {
    var self = this;
    self = _.extend(self, DefaultORM('td_destino_lixo'));
  };
});