var app = angular.module('licagro');

app.factory('Avaliacao', function(DefaultORM, TiposAvaliacao) {
  return function() {
    var self = this;
    self.relations = [{
      name: 'td_tipos_avaliacao',
      factory: TiposAvaliacao,
      type: 'belongs_to'
    }];


    self = _.extend(self, DefaultORM('tb_avaliacao', self.relations));
  };
});