var app = angular.module('licagro');

app.factory('DestinoLixo', function(DefaultORM) {
  return _.extend(DefaultORM('destino_lixo'), {});
});