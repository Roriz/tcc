var app = angular.module('licagro');

app.factory('Requerente', function(DefaultORM, Logradouro) {
  return function() {
    var self = this;
    self.relations = [{
      name: 'tb_logradouro',
      factory: Logradouro,
      type: 'belongs_to'
    }];
    self = _.extend(self, DefaultORM('tb_requerente', self.relations));
  };
});