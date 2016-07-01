var app = angular.module('licagro');

app.factory('Empreendimento', function(DefaultORM, Locadouro) {
  return function() {
    var self = this;
    self.relations = [{
      name: 'locadouro',
      factory: Locadouro,
      type: 'belongs_to'
    }];
    self = _.extend(self, DefaultORM('empreendimento', self.relations));
  };
});