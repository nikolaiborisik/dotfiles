(function(){
    window.slateEx = {
        buildXPositionStr : function(x){
            return 'screenOriginX+screenSizeX*'+x;
        },

        buildYPositionStr : function(y){
            return 'screenOriginY + screenSizeY*'+y;
        },

        buildWidthStr : function(size){
            return 'screenSizeX*' + size;
        },

        buildHeightStr : function(size){
            return 'screenSizeY*'+ size;
        },

        hideApp : function(appName){
            S.operation('hide', {'app': appName}).run();
        },

        showApp : function(appName){
            S.operation('show', {app : appName}).run();
        },

        focusApp : function(appName){
            S.operation('focus', {app : appName}).run();
        },

        fullscreen : slate.operation("move", {
            "x" : "screenOriginX",
            "y" : "screenOriginY",
            "width" : "screenSizeX",
            "height" : "screenSizeY"
        }),

        distractionModeWidth : 0.95,
        distractionMoveHeight : 0.95,
        distractionMode  : slate.operation("move", {
            "x" : "screenOriginX + screenSizeX*0.025",
            "y" : "screenOriginY + 20",
            "width" : "screenSizeX - screenSizeX*0.05",
            "height" : "screenSizeY-40"
        }),

        moveOp : function(x, y, w, h){
            return slate.operation('move', {
                x : slateEx.buildXPositionStr(x),
                y : slateEx.buildYPositionStr(y),
                width : slateEx.buildWidthStr(w),
                height : slateEx.buildHeightStr(h)
            });
        },

        move : function(x, y, w, h){
            slateEx.moveOp(x, y, w, h).run();
        },

        twoAppHorisontal : function(app1, app2, app1Width){
            slateEx.focusApp(app1);
            slateEx.moveOp(0, 0, app1Width, 1).run();

            slateEx.focusApp(app2);
            slateEx.moveOp(app1Width, 0, 1 - app1Width, 1).run();
        },

        threeAppHorisontal : function(app1, app2, app3, app1Width, app2Width){
            slateEx.focusApp(app1);
            slateEx.moveOp(0, 0, app1Width, 1).run();

            slateEx.focusApp(app2);
            slateEx.moveOp(app1Width, 0, app2Width, 1).run();

            slateEx.focusApp(app3);
            slateEx.moveOp(app1Width + app2Width, 0, 1 - app1Width - app2Width, 1).run();
        },

        threeAppH1V2 : function(app1, app2, app3, app1Width, app2Height){
            slateEx.focusApp(app1);
            slateEx.moveOp(0, 0, app1Width, 1).run();

            slateEx.focusApp(app2);
            slateEx.moveOp(app1Width, 0, 1 - app1Width, app2Height).run();

            slateEx.focusApp(app3);
            slateEx.moveOp(app1Width, app2Height, 1 -app1Width, 1 - app2Height).run();
        },

        appInDistractionMode : function(appName){
            slateEx.showApp(appName);
            slateEx.focusApp(appName);
            slateEx.distractionMode.run();
            slateEx.hideApp('all-but:current');
        },

        bindAppsKeys : function(appBinds, distractionHyper, focusHyper){
            for(var i = 0, len = appBinds.length; i < len; i++){
                var b = appBinds[i];

                (function(key, app){
                    slate.bind(key + ':'+distractionHyper, function(){
                        if(combo){
                            comboApp.push(app);
                        }else{
                            slateEx.appInDistractionMode(app);
                        }
                    });

                    slate.bind(key + ':' + focusHyper, function(){
                        slateEx.focusApp(app);
                    });
                })(b[0], b[1]);
            }
        }
    };

    slateEx.leftHalf =  slateEx.moveOp(0, 0, 0.5, 1);
    slateEx.rightHalf = slateEx.moveOp(0.5, 0, 0.5, 1);
    slateEx.left1_3 = slateEx.moveOp(0, 0, 0.25, 1);
    slateEx.right2_3 = slateEx.moveOp(0.25, 0, 0.75, 1);
    slateEx.left2_5 = slateEx.moveOp(0, 0, 0.4, 1);
    slateEx.right3_5 = slateEx.moveOp(0.4, 0, 0.6, 1);

    var CHROME = 'Google Chrome',
         MACVIM = 'MacVim',
         ITERM = 'iTerm',
         FIREFOX = 'Firefox',
         PHOTOSHOP = 'PHOTOSHOP',
         FINDER = 'Finder',
         XCODE = 'Xcode',
         SOURCETREE = 'SourceTree',
         SKYPE = 'Skype',
         IOSSIMULATOR = 'iOS Simulator',
         WESSTORM = 'WebStorm',
         MUCOMMANDER = 'muCommander',
         PREVIEW = 'Preview',
         MAIL = 'Mail',
         ATOM = 'Atom';





    var appBinds = [
        ['v', MACVIM ],
        ['c', CHROME],
        ['i', ITERM],
        ['m', FIREFOX],
        ['p', PHOTOSHOP],
        ['f', 'Finder'],
        ['x', 'Xcode'],
        ['t', 'SourceTree'],
        ['s', 'Skype'],
        ['o', 'iOS Simulator'],
        ['w', 'WebStorm'],
        ['n', 'muCommander'],
        ['a', 'Preview'],
        ['z', 'Mail'],
        ['l', ATOM]
    ];

    slateEx.bindAppsKeys(appBinds, 'ctrl;alt;cmd', 'ctrl;alt');

    slate.bind('right:cmd', function(){
        slateEx.moveOp(0, 0, 0.8, 1);
    });


    slate.bind('left:cmd', function(){
         slateEx.left2_5.run();
    });

    slate.bind('6:ctrl;alt;cmd', function(){
       slateEx.moveOp(0, 0, 1, 0.75).run();
       slateEx.focusApp('iTerm');
       slateEx.moveOp(0, 0.75, 1, 0.25).run();
      //  slateEx.moveOp(0, 0, 0.5, 1).run();
    });

    var layouts = [
        {
            key : 1,
            apps : ['Google Chrome', 'MacVim'],
            layout : 'twoAppHorisontal',
            params : [0.4]
        },
        {
            key : 2,
            apps : ['Google Chrome', 'MacVim'],
            layout : 'twoAppHorisontal',
            params : [0.25]
        }
    ];

    for(var i = 0; i < layouts.length; i++){
        var l = layouts[i];
        (function(l){
            slate.bind(l.key + ':ctrl;alt;cmd', function(){
                var appsCount = l.apps.length;
                var params;
                if(combo && appsCount === comboApp.length){
                    params = comboApp.concat(l.params);
                }else{
                    params = l.apps.concat(l.params);
                }
                slateEx[l.layout].apply(null, params);
            });

        }(l));
   }

    //slate.bind('1:ctrl;alt;cmd', function(){
        //if(combo){
            //if(comboApp.length === 2){
                //slateEx.twoAppHorisontal(comboApp[0], comboApp[1], 0.4);
                //combo = false;
            //}
        //}else{
            //slateEx.twoAppHorisontal('Google Chrome', 'MacVim', 0.4);
        //}
    //});

    //slate.bind('2:ctrl;alt;cmd', function(){
        //var app1 = "Google Chrome",
            //app2 = "MacVim";

        //if(combo && comboApp.length === 2){
            //app1 = comboApp[0];
            //app2 = comboApp[1];
        //}

        //slateEx.twoAppHorisontal(app1, app2, 0.6);
    //});

    slate.bind('3:ctrl;alt;cmd', function(){
        slateEx.twoAppHorisontal('Skype', 'Google Chrome', 0.3);
    });

    slate.bind('4:ctrl;alt;cmd', function(){
        slateEx.threeAppHorisontal('Google Chrome', 'iTerm', 'MacVim', 0.4, 0.3);
    });
    slate.bind('5:ctrl;alt;cmd', function(){
        slateEx.threeAppH1V2('Google Chrome', 'iTerm', 'MacVim', 0.5, 0.5);
    });

    var combo = false;
    var comboKeys = '';
    var comboApp = [];

    slate.bind(',:ctrl;alt;cmd', function(){
        combo = true;
        comboApp = [];
        setTimeout(function(){combo = false;}, 1500);
    });




})();
