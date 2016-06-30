    var app = angular.module('licagro');

    app.factory('menus', function() {
      var menus = {};
      menus.bread = [];
      menus.list = [{
        "icon": "icon iconSign",
        "name": "Licença",
        "displaySubmenu": true,
        "href": false,
        "subMenu": [{
          "name": "Inclusão",
          "displaySubmenu": true,
          "href": false,
          "subMenu": [{
            "name": "Licença Prévia",
            "href": "#/licenciamento/edit",
          }, {
            "name": "Licença de Instalação",
            "href": "#licenciamento/edit-li-lo?type=2",
          }, {
            "name": "Licença de Operação",
            "href": "#licenciamento/edit-li-lo?type=3",
          }]
        }, {
          "name": "Avaliação",
          "displaySubmenu": false,
          "href": false,
        }, {
          "name": "Relatórios",
          "displaySubmenu": false,
          "href": false,
        }]
      }, {
        "icon": "icon iconLogout",
        "name": "Sair",
        "displaySubmenu": false,
        "href": "/auth/logout"
      }];
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