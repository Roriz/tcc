var app = angular.module('licagro');

app.factory('DefaultORM', function() {
  var prefix = 'licagro_';
  return function(modelName, relations) {
    return {
      relations: _.isEmpty(relations) ? [] : relations,
      search: function(q, db) {
        if (!_.isEmpty(q)) {
          var qLength = Object.keys(q).length;
          _.remove(db, function(n) {
            var find = 0;
            if (n) {
              _.each(q, function(value, key) {
                if (n[key] && n[key] == value) {
                  find++;
                }
              });
            }
            return qLength == find ? false : true;
          });
        }
        return db;
      },
      getFactory: function(anotherModel) {
        var db = localStorage.getItem(prefix + (anotherModel ? anotherModel : modelName));
        return db ? JSON.parse(db) : [];
      },
      setFactory: function(db) {
        localStorage.setItem(prefix + modelName, JSON.stringify(db));
      },
      get_relations: function(model, cb) {
        var self = this;
        var sync = 0;
        if (!_.isEmpty(self.relations)) {
          _.each(self.relations, function(relation) {
            if (relation.type == 'belongs_to') {
              sync++;

              new relation.factory().get(model[relation.name + '_id'], function(d) {
                if (d) {
                  d.parent_model = model.parent_model ? model.parent_model : [];
                  d.parent_model.push(modelName);

                  model[relation.name] = d;
                  if (self.relations.length <= sync) {
                    cb(model);
                  }
                } else {
                  if (self.relations.length <= sync) {
                    cb(model);
                  }
                }
              });

            } else if (relation.type == 'has_many') {

              sync++;
              new relation.factory().query(_.set({}, modelName + '_id', model.id), function(d) {
                if (d.length) {
                  model[relation.name] = d;
                  if (self.relations.length <= sync) {
                    cb(model);
                  }
                } else {
                  if (self.relations.length <= sync) {
                    cb(model);
                  }
                }
              });

            }
          });
        } else {
          cb(model);
        }
      },
      as_json: function(d, cb) {
        var self = this;
        if (_.isArray(d)) {
          if (d.length) {
            var sync = 0;
            var collection = [];
            _.each(d, function(model) {
              sync++;
              self.get_relations(model, function(resp) {
                collection.push(resp);
                if (d.length <= sync) {
                  cb(collection);
                }
              });
            });
          } else {
            cb(d);
          }
        } else {
          self.get_relations(d, function(model) {
            cb(model);
          });
        }
      },
      createId: function() {
        var self = this;
        var db = self.getFactory();
        var maxId = 1;
        _.each(db, function(value) {
          if (value.id > maxId) {
            maxId = value.id;
          }
        });
        return ++maxId;
      },



      query: function(q, cb) {
        var self = this;
        var db = self.getFactory();
        self.as_json(self.search(q, db), function(d) {
          cb(d);
        });
      },
      get: function(id, cb) {
        var self = this;
        var db = self.getFactory();

        self.search({
          id: id
        }, db);
        self.as_json(_.first(db), function(model) {
          cb(model);
        });
      },
      create: function(model, cb) {
        var self = this;
        var db = self.getFactory();

        if (!model.id) {
          model.id = self.createId();
        }

        db[model.id] = model;
        self.setFactory(db);

        cb(model);
      },
      update: function(model, cb) {
        var self = this;
        var db = self.getFactory();

        db[_.findIndex(db, function(o) {
          return o.id == model.id;
        })] = model;

        self.setFactory(db);
        cb(model);
      },
      delete: function() {
        var self = this;
        var db = localStorage.removeItem(prefix + modelName);
        return true;
      },
      paged: function(q, cb) {
        var self = this;
        var db = self.getFactory();
        var collection = self.search(q.q, db);

        self.as_json(collection, function(d) {
          cb(d);
        })
      }
    }
  }
});