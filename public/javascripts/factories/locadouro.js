var app = angular.module('licagro');

app.factory('Locadouro', function(DefaultORM) {
  return function() {
    var self = this;
    self.relations = [];
    self = _.extend(self, DefaultORM('locadouro', self.relations));
  };
});