var app = angular.module('licagro');

app.factory('DefaultORM', function() {
  var prefix = 'licagro_';
  return function(modelName) {
    return {
      search: function(q, db) {
        if (!_.isEmpty(q)) {
          var qLength = Object.keys(q).length;
          _.remove(db, function(n) {
            var find = 0;
            _.each(q, function(value, key) {
              if (n[key] && n[key] == value) {
                find++;
              }
            });
            return qLength == find ? false : true;
          });
        }
        return db;
      },
      getFactory: function() {
        var db = localStorage.getItem(prefix + modelName);
        return db ? JSON.parse(db) : [];
      },
      setFactory: function(db) {
        localStorage.setItem(prefix + modelName, JSON.stringify(db));
      },



      query: function(q, cb) {
        var db = this.getFactory();
        cb(this.search(q, db));
      },
      get: function(id, cb) {
        var db = this.getFactory();

        this.search({
          id: id
        }, db);

        cb(_.first(db));
      },
      create: function(model, cb) {
        var db = this.getFactory();

        last = _.last(db);
        model.id = last ? last.id + 1 : 0;

        db[model.id] = model;
        this.setFactory(db);

        cb(model);
      },
      update: function(model, cb) {
        var db = this.getFactory();

        db[_.findIndex(db, function(o) {
          return o.id == model.id;
        })] = model;

        this.setFactory(db);
        cb(model);
      },
      delete: function() {
        var db = localStorage.removeItem(prefix + modelName);
        return true;
      },
      paged: function(q, cb) {
        var db = this.getFactory();
        cb(this.search(q, db));
      }
    }
  }
});