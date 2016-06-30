var app = angular.module('licagro');

app.factory('TipoLixoGerado', function(DefaultORM) {
  return _.extend(DefaultORM('tipo_lixo_gerado'), {});
});