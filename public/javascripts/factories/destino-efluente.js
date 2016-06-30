var app = angular.module('licagro');

app.factory('DestinoEfluente', function(DefaultORM) {
  return _.extend(DefaultORM('destino_efluente'), {});
});