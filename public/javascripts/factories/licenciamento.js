var app = angular.module('licagro');

app.factory('Licenciamento', function(DefaultORM) {
  return _.extend(DefaultORM('licenciamento'), {
    last_status: function(tb_licenciamento_status) {
      tb_licenciamento_status = _.sortBy(tb_licenciamento_status, function(o) {
        return _.get(o, 'dta');
      });
      return _.last(tb_licenciamento_status);
    }
  });
});