var fullscreen = slate.operation("move", {
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var distractionMode  = slate.operation("move", {
  "x" : "screenOriginX + screenSizeX*0.025",
  "y" : "screenOriginY + 20",
  "width" : "screenSizeX - screenSizeX*0.05",
  "height" : "screenSizeY-40"
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
    S.operation('focus', {app : appName}).run();
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

var appInDistractionMode = function(appName){
    showApp(appName);
    focusApp(appName);
    distractionMode.run();
    hideApp('all-but:current');
};


var appBinds = [
    ['j', 'MacVim' ],
    ['k', 'Google Chrome'],
    ['l', 'iTerm'],
    ['h', 'Firefox'],
    ['b', 'Photoshop'],
    ['n', 'Finder'],
    ['y', 'Xcode'],
    ['p', 'SourceTree'],
    ['m', 'Safari'],
    ['g', 'iOS Simulator']
];

for(var i = 0, len = appBinds.length; i < len; i++){
    var b = appBinds[i];

    (function(key, app){
        slate.bind(key + ':ctrl;alt;cmd', function(){
            appInDistractionMode(app);
        });
    })(b[0], b[1]);
}
