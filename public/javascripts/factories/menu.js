    var app = angular.module('licagro');

    app.factory('menus', function() {
      var menus = {};
      menus.bread = [];
      if (window.CURRENTUSER.type == 1) {
        menus.list = [{
          "icon": "fa fa-home",
          "name": "Inicial",
          "href": "/home",
          "displaySubmenu": false,
        }, {
          "icon": "icon iconSign",
          "name": "Licença",
          "href": "#/",
          "displaySubmenu": true,
          "subMenu": [{
            "name": "Inclusão",
            "displaySubmenu": true,
            "icon": "fa fa-plus",
            "subMenu": [{
              "icon": "fa fa-newspaper-o fa-blue",
              "name": "Licença Prévia",
              "href": "#/licenciamento/edit",
            }, {
              "icon": "fa fa-newspaper-o fa-green",
              "name": "Licença de Instalação",
              "href": "#licenciamento/edit-li-lo?type=2",
            }, {
              "icon": "fa fa-newspaper-o fa-red",
              "name": "Licença de Operação",
              "href": "#licenciamento/edit-li-lo?type=3",
            }]
          }]
        }, {
          "icon": "fa fa-external-link-square",
          "name": "Emitir Licença",
          "displaySubmenu": false,
        }, {
          "icon": "fa fa-search",
          "name": "Avaliação",
          "displaySubmenu": false,
          "href": '#licenciamento/avaliar',
        }, {
          "icon": "fa fa-print",
          "name": "Relatórios",
          "displaySubmenu": false,
        }, {
          "icon": "icon iconLogout",
          "name": "Sair",
          "displaySubmenu": false,
          "href": "/auth/logout"
        }];
      } else if (window.CURRENTUSER.type == 2) {
        menus.list = [{
          "icon": "fa fa-home",
          "name": "Inicial",
          "href": "#home",
          "displaySubmenu": false,
        }, {
          "icon": "fa fa-external-link-square",
          "name": "Consulta",
          "href": "#consulta",
          "displaySubmenu": false,
        }, {
          "icon": "icon iconLogout",
          "name": "Sair",
          "displaySubmenu": false,
          "href": "/auth/logout"
        }];
      }
      menus.selectMenu = function(dom) {
        if (dom.target) {
          dom = dom.target;
        }
        dom = $(dom);
        if (dom.parent().hasClass('menu-item-content')) {
          dom = dom.parent();
        }

        dom.closest('.menu').find('.selected').removeClass('selected');
        dom.parent().addClass('selected');
      };

      menus.findbread = function(collection, currentRoute, bread) {
        var self = this;
        var response = false;
        if (!bread) {
          bread = [];
        }
        _.each(collection, function(model) {
          var currentResponse = false;
          if (model.href && model.href.replace('#', '/') == currentRoute) {
            model.selected = true;
            bread.push(model.name);
            currentResponse = bread;
            response = bread;
          } else {
            model.selected = false;
          }
          if (model.subMenu) {
            var subMenuBread = menus.findbread(model.subMenu, currentRoute, _.union(bread, [model.name]));
            if (subMenuBread) {
              currentResponse = subMenuBread;
              response = subMenuBread;
            } else {
              if (currentResponse) {
                model.selected = true;
              }
            }
          } else {
            if (currentResponse) {
              model.selected = true;
            }
          }
          if (currentResponse) {
            model.displaySubmenu = true;
          }
        });
        return response;
      };

      return menus;
    });