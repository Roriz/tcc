var app = angular.module('licagro');

app.factory('Correspondencia', function(DefaultORM, Locadouro) {
  return function() {
    var self = this;
    self.relations = [{
      name: 'locadouro',
      factory: Locadouro,
      type: 'belongs_to'
    }];
    self = _.extend(self, DefaultORM('correspondencia', self.relations));
  };
});