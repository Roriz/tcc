var app = angular.module('licagro');

app.factory('Situacao', function(DefaultORM, Status) {
  return function() {
    var self = this;
    self.relations = [{
      name: 'td_status',
      factory: Status,
      type: 'belongs_to'
    }];
    self = _.extend(self, DefaultORM('td_situacao', self.relations));
  };
});