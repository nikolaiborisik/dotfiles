var buildXPositionStr = function(x){
    return 'screenOriginX+screenSizeX*'+x; 
};

var buildYPositionStr = function(y){
    return 'screenOriginY + screenSizeY*'+y;
};

var buildWidthStr = function(size){
    return 'screenSizeX*' + size;
};

var buildHeightStr = function(size){
    return 'screenSizeY*'+ size;
};

var hideApp = function(appName){
    S.operation('hide', {'app': appName}).run();
};

var showApp = function(appName){
    S.operation('show', {app : appName}).run();
};

var focusApp = function(appName){
    S.operation('focus', {app : appName}).run();
};

var fullscreen = slate.operation("move", {
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var distractionModeWidth = 0.95;
var distractionMoveHeight = 0.95;
var distractionMode  = slate.operation("move", {
  "x" : "screenOriginX + screenSizeX*0.025",
  "y" : "screenOriginY + 20",
  "width" : "screenSizeX - screenSizeX*0.05",
  "height" : "screenSizeY-40"
});

var moveOp = function(x, y, w, h){
     return slate.operation('move', {
        x : buildXPositionStr(x),
        y : buildYPositionStr(y),
        width : buildWidthStr(w),
        height : buildHeightStr(h)
    });
};



var leftHalf =  moveOp(0, 0, 0.5, 1);
var rightHalf = moveOp(0.5, 0, 0.5, 1);
var left1_3 = moveOp(0, 0, 0.25, 1);
var right2_3 = moveOp(0.25, 0, 0.75, 1);
var left2_5 = moveOp(0, 0, 0.4, 1);
var right3_5 = moveOp(0.4, 0, 0.6, 1);

var twoAppHorisontal = function(app1, app2, app1Width){
    focusApp(app1);
    moveOp(0, 0, app1Width, 1).run();

    focusApp(app2);
    moveOp(app1Width, 0, 1 - app1Width, 1).run();
};

var threeAppHorisontal = function(app1, app2, app3, app1Width, app2Width){
    focusApp(app1);
    moveOp(0, 0, app1Width, 1).run();

    focusApp(app2);
    moveOp(app1Width, 0, app2Width, 1).run();

    focusApp(app3);
    moveOp(app1Width + app2Width, 0, 1 - app1Width - app2Width, 1).run();
};

var threeAppH1V2 = function(app1, app2, app3, app1Width, app2Height){
    focusApp(app1);
    moveOp(0, 0, app1Width, 1).run();

    focusApp(app2);
    moveOp(app1Width, 0, 1 - app1Width, app2Height).run();

    focusApp(app3);
    moveOp(app1Width, app2Height, 1 -app1Width, 1 - app2Height).run();
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
    ['v', 'MacVim' ],
    ['c', 'Google Chrome'],
    ['i', 'iTerm'],
    ['m', 'Firefox'],
    ['p', 'Photoshop'],
    ['f', 'Finder'],
    ['x', 'Xcode'],
    ['t', 'SourceTree'],
    ['s', 'Skype'],
    ['o', 'iOS Simulator'],
    ['w', 'WebStorm'],
    ['n', 'muCommander'],
    ['a', 'Preview'],
    ['z', 'Mail']
];

for(var i = 0, len = appBinds.length; i < len; i++){
    var b = appBinds[i];

    (function(key, app){
        slate.bind(key + ':ctrl;alt;cmd', function(){
            if(combo){
                comboApp.push(app);
            }else{
                appInDistractionMode(app);
            }
        });

        slate.bind(key + ':ctrl;alt', function(){
            focusApp(app);
        });
    })(b[0], b[1]);
}


slate.bind('right:cmd', function(){
 //rightHalf.run();
 //right2_3.run();
    //right3_5.run();
     moveOp(0, 0, 0.5, 1);
});


slate.bind('left:cmd', function(){
    //leftHalf.run();
    //left1_3.run();
    left2_5.run();
});



slate.bind('1:ctrl;alt;cmd', function(){
    if(combo){
        if(comboApp.length === 2){
            twoAppHorisontal(comboApp[0], comboApp[1], 0.4);
            combo = false;
        }
    }else{
        twoAppHorisontal('Google Chrome', 'MacVim', 0.4);
    }
});

slate.bind('2:ctrl;alt;cmd', function(){
    twoAppHorisontal('Google Chrome', 'MacVim', 0.6);
});

slate.bind('3:ctrl;alt;cmd', function(){
    twoAppHorisontal('Skype', 'Google Chrome', 0.3);
});

slate.bind('4:ctrl;alt;cmd', function(){
    threeAppHorisontal('Google Chrome', 'iTerm', 'MacVim', 0.4, 0.3);
});
slate.bind('5:ctrl;alt;cmd', function(){
    threeAppH1V2('Google Chrome', 'iTerm', 'MacVim', 0.4, 0.3);
});

var combo = false;
var comboKeys = '';
var comboApp = [];

slate.bind(',:ctrl;alt;cmd', function(){
    combo = true;
    comboApp = [];
    setTimeout(function(){combo = false;}, 1500);
});

slate.bind('6:ctrl;alt;cmd', function(){
    if(combo){
        leftHalf.run();
        combo = false;
    }else{
        rightHalf.run();
    }
});



