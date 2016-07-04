var app = angular.module('licagro');

app.factory('LicenciamentoStatus', function(DefaultORM, Situacao) {
  return function() {
    var self = this;
    self.relations = [{
      name: 'td_situacao',
      factory: Situacao,
      type: 'belongs_to'
    }];
    self = _.extend(self, DefaultORM('tb_licenciamento_status', self.relations));
  };
});