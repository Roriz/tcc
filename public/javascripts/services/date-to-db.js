var app = angular.module('licagro');

app.factory('DateToDB', function() {
  return function(date) {
    if (_.isDate(date)) {
      return date.getFullYear() + '-' + _.padStart((date.getMonth() + 1), 2, '0') + '-' + date.getDate();
    } else {
      return '';
    }
  }
});