var app = angular.module('licagro');

app.factory('Layout', function() {
  var layout = {
    type: 'desktop', // can be desktop or mobile
    hanburger: true, // can be true or false
    changeHanburger: function() {
      this.hanburger = this.hanburger ? false : true;
    }
  }

  return layout;
});