var app = angular.module('licagro');

app.factory('Requerente', function(DefaultORM, Correspondencia, Empreendimento, Locadouro) {
  return function() {
    var self = this;
    self.relations = [{
      name: 'correspondencia',
      factory: Correspondencia,
      type: 'belongs_to'
    }, {
      name: 'empreendimento',
      factory: Empreendimento,
      type: 'belongs_to'
    }, {
      name: 'locadouro',
      factory: Locadouro,
      type: 'belongs_to'
    }];
    self = _.extend(self, DefaultORM('requerente', self.relations));
  };
});