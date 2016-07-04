var app = angular.module('licagro');

app.factory('TipoAtividade', function(DefaultORM) {
  return function() {
    var self = this;
    self = _.extend(self, DefaultORM('td_tipo_atividade'));
  };
});