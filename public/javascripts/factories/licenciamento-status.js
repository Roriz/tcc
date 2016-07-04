var app = angular.module('licagro');

app.factory('LicenciamentoStatus', function(DefaultORM, Situacao, Avaliacao) {
  return function() {
    var self = this;
    self.relations = [{
      name: 'td_situacao',
      factory: Situacao,
      type: 'belongs_to'
    }, {
      name: 'tb_avaliacao',
      factory: Avaliacao,
      type: 'has_many'
    }];

    self.last_avaliacao = function(tb_avaliacao) {
      tb_avaliacao = _.sortBy(tb_avaliacao, function(o) {
        return _.get(o, 'dta');
      });
      return _.last(tb_avaliacao);

    }


    self = _.extend(self, DefaultORM('tb_licenciamento_status', self.relations));
  };
});