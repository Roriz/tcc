var app = angular.module('licagro');

app.factory('Licenciamento', function(
  DefaultORM,
  Status, Requerente, TipoAtividade, FaseEmpreendimento,
  SituacaoImovel, AbastecimentoAgua, EfluenteLiquido,
  DestinoLixo, DestinoEfluente, TipoLixoGerado, LicenciamentoStatus,
  Responsavel, Correspondencia, Empreendimento
) {
  var tipos_licenciamento = new Status();
  var LICENCA_PREVIA = 1;
  var LICENCA_INSTALACAO = 2;
  var LICENCA_OPERACAO = 3;
  return function() {
    var self = this;
    self.relations = [{
      name: 'tb_correspondencia',
      factory: Correspondencia,
      type: 'belongs_to'
    }, {
      name: 'tb_empreendimento',
      factory: Empreendimento,
      type: 'belongs_to'
    }, {
      name: 'tb_responsavel',
      factory: Responsavel,
      type: 'belongs_to'
    }, {
      name: 'tb_requerente',
      factory: Requerente,
      type: 'belongs_to'
    }, {
      name: 'td_tipo_atividade',
      factory: TipoAtividade,
      type: 'belongs_to'
    }, {
      name: 'td_fase_empreendimento',
      factory: FaseEmpreendimento,
      type: 'belongs_to'
    }, {
      name: 'td_situacao_imovel',
      factory: SituacaoImovel,
      type: 'belongs_to'
    }, {
      name: 'td_abastecimento_agua',
      factory: AbastecimentoAgua,
      type: 'belongs_to'
    }, {
      name: 'td_efluente_liquido',
      factory: EfluenteLiquido,
      type: 'belongs_to'
    }, {
      name: 'td_destino_lixo',
      factory: DestinoLixo,
      type: 'belongs_to'
    }, {
      name: 'td_destino_efluente',
      factory: DestinoEfluente,
      type: 'belongs_to'
    }, {
      name: 'td_tipo_lixo_gerado',
      factory: TipoLixoGerado,
      type: 'belongs_to'
    }, {
      name: 'tb_licenciamento_status',
      factory: LicenciamentoStatus,
      type: 'has_many'
    }];

    self.can_prorrogar = function(lic) {
      if (self.last_status(lic.tb_licenciamento_status).td_situacao.td_status.id == LICENCA_PREVIA ||
        self.last_status(lic.tb_licenciamento_status).td_situacao.td_status.id == LICENCA_INSTALACAO) {
        return true;
      }
      return false;
    }
    self.can_renovar = function(lic) {
      if (self.last_status(lic.tb_licenciamento_status).td_situacao.td_status.id == LICENCA_OPERACAO) {
        return true;
      }
      return false;
    }
    self.last_status = function(tb_licenciamento_status) {
      tb_licenciamento_status = _.sortBy(tb_licenciamento_status, function(o) {
        return _.get(o, 'dta');
      });
      return _.last(tb_licenciamento_status);
    };
    self.takeLastStatus = function(td_status_id) {
      var licences = [];
      _.each(self.tb_licenciamento_status, function(tb_licenciamento_status) {
        if (_.get(tb_licenciamento_status, 'td_situacao.td_status.id') == td_status_id) {
          licences.push(tb_licenciamento_status);
        }
      });
      return self.last_status(licences);
    };
    self = _.extend(self, DefaultORM('tb_licenciamento', self.relations));
  };
});