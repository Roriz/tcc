var app = angular.module('licagro');

app.factory('Logradouro', function(DefaultORM) {
  return function() {
    var self = this;
    self.relations = [];
    self = _.extend(self, DefaultORM('tb_logradouro', self.relations));
  };
});