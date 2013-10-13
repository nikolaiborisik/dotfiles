var fullscreen = slate.operation("move", {
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

slate.bind('2:ctrl', function(win){
    win.doOperation(fullscreen);
});


var hideApp = function(appName){
    S.operation('hide', {'app': appName}).run();
};

var showApp = function(appName){
    S.operation('show', {app : appName}).run();
};

var focusApp = function(appName){
    S.operation('focus', {app : appName});
};

slate.bind('1:ctrl', function(win){
    showApp('Google Chrome');
    showApp('MacVim');
    focusApp('MacVim');
    slate.eachApp(function(app){
       var name = app.name();
       if(['MacVim', 'Google Chrome'].indexOf(name) === -1){
           hideApp(name); 
       }
    });
});
