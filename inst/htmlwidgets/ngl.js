HTMLWidgets.widget({
  name: 'ngl',
  type: 'output',
  factory: function(el, width, height) {
    var stage = new NGL.Stage(el.id);
    return {
      renderValue: function(x) {
        stage.loadFile(x.data).then(function (component) {
          component.addRepresentation('cartoon');
          component.autoView();
        });
      },
      s: stage
    }
  }
});
