var app = angular.module('licagro');

app.factory('Licenciamento', function() {
  var prefix = 'licagro_';
  var getFactory = function() {
    var db = localStorage.getItem(prefix + "licenciamento");
    return db ? JSON.parse(db) : [];
  }
  var search = function(q, db) {
    _.remove(db, function(n) {
      var find = false;
      _.each(q, function(value, key) {
        if (n[key] && n[key] == value) {
          find = true;
        }
      });
      return !find;
    })
    return db;
  }

  return {
    last_status: function(tb_licenciamento_status) {
      tb_licenciamento_status = _.sortBy(tb_licenciamento_status, function(o) {
        return _.get(o, 'dta');
      });
      return _.last(tb_licenciamento_status);
    },
    query: function(q, cb) {
      var db = getFactory();
      var d = search(q, db);
      if (_.isArray(d)) {
        d = _.first(d);
      }
      cb(d);
    },
    get: function(id, cb) {
      var db = getFactory();

      cb(db[id]);
    },
    create: function(model, cb) {
      var db = getFactory();

      last = _.last(db);
      model.id = last ? last.id + 1 : 0;

      db[model.id] = model;
      var db = localStorage.setItem(prefix + 'licenciamento', JSON.stringify(db));

      cb(model);
    },
    update: function(model, cb) {
      var db = getFactory();
      db[model.id] = model;
      var db = localStorage.setItem(prefix + 'licenciamento', JSON.stringify(db));

      cb(model);
    },
    delete: function() {
      var db = localStorage.removeItem(prefix + 'favoriteflavor');
      return true;
    },
    paged: function(q, cb) {
      var db = getFactory();
      cb(search(q, db));
    }
  };
});