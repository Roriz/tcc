var app = angular.module('licagro');

app.factory('FaseEmpreendimento', function(DefaultORM) {
  return function() {
    var self = this;
    self = _.extend(self, DefaultORM('fase_empreendimento'));
  };
});