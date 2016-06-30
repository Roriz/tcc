var app = angular.module('licagro');

app.factory('TipoAtividade', function(DefaultORM) {
  return _.extend(DefaultORM('tipo_atividade'), {});
});