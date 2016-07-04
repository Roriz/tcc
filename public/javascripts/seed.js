var prefix = 'licagro_';
localStorage.clear();

_.each(seed, function(info) {
  if (info.length > 0) {
    var has_id = false;
    var columns = [];
    _.each(info[0].columns, function(column, key) {
      columns[key] = column;
      if (column == 'id') {
        has_id = true;
      }
    });

    var id = 1;
    var data = [];
    _.each(info[0].rows, function(row) {
      var line = {};
      _.each(row, function(d, key) {
        if (_.isObject(d)) {
          line[columns[key]] = null;
        } else {
          line[columns[key]] = d;
        }
      });

      if (has_id === false) {
        line['id'] = id;
      }

      data.push(line);
      id++;
    });

    localStorage.setItem(prefix + info[0].table.table, JSON.stringify(data));
  }

});