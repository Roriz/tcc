var app = angular.module('licagro');

app.factory('FaseEmpreendimento', function(DefaultORM) {
  return _.extend(DefaultORM('fase_empreendimento'), {});
});