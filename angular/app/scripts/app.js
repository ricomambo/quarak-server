'use strict';

window.App = angular.module('quarak', [
  'ngRoute',
  'ngCookies',
  'ngResource',
  'ngSanitize'
])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/expenses.html',
        controller: 'ExpensesCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
