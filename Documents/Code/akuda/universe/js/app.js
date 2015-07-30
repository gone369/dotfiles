var universeApp = angular.module('universeApp', [
'ngRoute',
'ngAnimate',
'akudachart',
'akudaSearch',
'akudaDatePicker',
'viewApp',
'dataApi',
'smoothScroll',
'datePicker',
'mm.foundation']);

universeApp.config(function($routeProvider, $locationProvider) {
  $routeProvider.when('/', {
    templateUrl: './static/js/view/view.html',
    controller: 'viewCtrl',
  }).otherwise({
    redirectTo: '/'
  });
})
.run(function($rootScope) {
  $rootScope.window = window;
  $rootScope.$on('$viewContentLoaded', function () {
    $rootScope.Modernizr = Modernizr;
    $(document).ready(function(){
    });
    $(window).resize(function(){
    });
  });
});
