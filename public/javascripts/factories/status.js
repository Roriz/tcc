var app = angular.module('licagro');

app.factory('Status', function(DefaultORM) {
  return function() {
    var self = this;
    self = _.extend(self, DefaultORM('td_status'));
  };
});