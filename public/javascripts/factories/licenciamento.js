var app = angular.module('licagro');

app.factory('Licenciamento', function(
  DefaultORM,
  TiposLicenciamento, Requerente, TipoAtividade, FaseEmpreendimento,
  SituacaoImovel, AbastecimentoAgua, EfluenteLiquido,
  DestinoLixo, DestinoEfluente, TipoLixoGerado, LicenciamentoStatus
) {
  var tipos_licenciamento = new TiposLicenciamento();
  var LICENCA_PREVIA = false;
  tipos_licenciamento.get(1, function(r) {
    LICENCA_PREVIA = r.name;
  });
  var LICENCA_INSTALACAO = false;
  tipos_licenciamento.get(2, function(r) {
    LICENCA_INSTALACAO = r.name;
  });
  var LICENCA_OPERACAO = false;
  tipos_licenciamento.get(3, function(r) {
    LICENCA_OPERACAO = r.name;
  });
  return function() {
    var self = this;
    self.relations = [{
      name: 'requerente',
      factory: Requerente,
      type: 'belongs_to'
    }, {
      name: 'tipo_atividade',
      factory: TipoAtividade,
      type: 'belongs_to'
    }, {
      name: 'fase_empreendimento',
      factory: FaseEmpreendimento,
      type: 'belongs_to'
    }, {
      name: 'situacao_imovel',
      factory: SituacaoImovel,
      type: 'belongs_to'
    }, {
      name: 'abastecimento_agua',
      factory: AbastecimentoAgua,
      type: 'belongs_to'
    }, {
      name: 'efluente_liquido',
      factory: EfluenteLiquido,
      type: 'belongs_to'
    }, {
      name: 'destino_lixo',
      factory: DestinoLixo,
      type: 'belongs_to'
    }, {
      name: 'destino_efluente',
      factory: DestinoEfluente,
      type: 'belongs_to'
    }, {
      name: 'tipo_lixo_gerado',
      factory: TipoLixoGerado,
      type: 'belongs_to'
    }, {
      name: 'licenciamento_status',
      factory: LicenciamentoStatus,
      type: 'has_many'
    }];

    self.can_prorrogar = function(lic) {
      if (self.last_status(lic.licenciamento_status).td_tipos_licenciamento == LICENCA_PREVIA ||
        self.last_status(lic.licenciamento_status).td_tipos_licenciamento == LICENCA_INSTALACAO) {
        return true;
      }
      return false;
    }
    self.can_renovar = function(lic) {
      if (self.last_status(lic.licenciamento_status).td_tipos_licenciamento == LICENCA_OPERACAO) {
        return true;
      }
      return false;
    }
    self.last_status = function(licenciamento_status) {
      licenciamento_status = _.sortBy(licenciamento_status, function(o) {
        return _.get(o, 'dta');
      });
      return _.last(licenciamento_status);
    };
    self = _.extend(self, DefaultORM('licenciamento', self.relations));
  };
});