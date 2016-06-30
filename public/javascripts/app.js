angular.module('licagro', [
  'ngRoute',
  'ngResource',
  'agGrid',
  'ngMaterial',
  'ngMessages',
  'ui.mask',
  'ngFileUpload',
  'openlayers-directive',
  'ui.bootstrap',
  'ngSanitize',
  'ngImgCrop'
])
  .run(function($rootScope) {
    $rootScope.canChangeRouter = true;
  });