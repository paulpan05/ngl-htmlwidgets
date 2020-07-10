HTMLWidgets.widget({
  name: 'ngl',
  type: 'output',
  factory: function(el, width, height) {
    var stage = new NGL.Stage(el.id);
    return {
      renderValue: function(x) {
        var stringBlob = new Blob([x.data], {type: 'text/plain'});
        stage.loadFile(stringBlob).then(function (component) {
          component.addRepresentation('cartoon');
          component.autoView();
        });
      },
      s: stage
    }
  }
});
