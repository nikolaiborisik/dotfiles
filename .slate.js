(function() {
   var combo = false;
   var comboKeys = '';
   var comboApp = [];
   var currentApps = [];
   var currentLayout = null;
   var currentParams = null;
   var comboResetTimeout = 3000;
   var hyper = 'ctrl;alt;cmd';
   var hyperPlus = hyper + ';shift';

   var buildXProcentPositionStr = function(x) {
         return 'screenOriginX+screenSizeX*' + x;
      },

      buildYProcentPositionStr = function(y) {
         return 'screenOriginY + screenSizeY*' + y;
      },

      buildProcentWidthStr = function(size) {
         return 'screenSizeX*' + size;
      },

      buildProcentHeightStr = function(size) {
         return 'screenSizeY*' + size;
      },

      hideApp = function(appName) {
         S.operation('hide', {
            'app': appName
         }).run();
      },

      showApp = function(appName) {
         S.operation('show', {
            app: appName
         }).run();
      },

      focusApp = function(appName) {
         S.operation('focus', {
            app: appName
         }).run();
      },

      fullscreen = slate.operation("move", {
         "x": "screenOriginX",
         "y": "screenOriginY",
         "width": "screenSizeX",
         "height": "screenSizeY"
      }),

      distractionMode = slate.operation("move", {
         "x": "screenOriginX + 5",
         "y": "screenOriginY + 5",
         "width": "screenSizeX - 10",
         "height": "screenSizeY- 10"
      }),

      moveOp = function(x, y, w, h) {
         return slate.operation('move', {
            x: buildXProcentPositionStr(x),
            y: buildYProcentPositionStr(y),
            width: buildProcentWidthStr(w),
            height: buildProcentHeightStr(h)
         });
      },

      move = function(x, y, w, h) {
         moveOp(x, y, w, h).run();
      },

      twoAppHorisontal = function(app1, app2, app1Width) {
         focusApp(app1);
         move(0, 0, app1Width, 1);

         focusApp(app2);
         move(app1Width, 0, 1 - app1Width, 1);
      },

      threeAppHorisontal = function(app1, app2, app3, app1Width, app2Width) {
         focusApp(app1);
         move(0, 0, app1Width, 1);

         focusApp(app2);
         move(app1Width, 0, app2Width, 1);

         focusApp(app3);
         move(app1Width + app2Width, 0, 1 - app1Width - app2Width, 1);
      },

      threeAppH1V2 = function(app1, app2, app3, app1Width, app2Height) {
         focusApp(app1);
         move(0, 0, app1Width, 1);

         focusApp(app2);
         move(app1Width, 0, 1 - app1Width, app2Height);

         focusApp(app3);
         move(app1Width, app2Height, 1 - app1Width, 1 - app2Height);
      },

      appInDistractionMode = function(appName) {
         showApp(appName);
         focusApp(appName);
         distractionMode.run();
         hideApp('all-but:current');
      },

      bindAppsKeys = function(appBinds, distractionHyper, focusHyper) {
         for (var i = 0, len = appBinds.length; i < len; i++) {
            var b = appBinds[i];

            (function(key, app) {
               S.log(key + ':' + distractionHyper);
               slate.bind(key + ':' + distractionHyper, function() {
                  if (combo) {
                     S.log('combo add app ' + app);
                     comboApp.push(app);
                  } else {
                     S.log('distraction mode app ' + app);
                     appInDistractionMode(app);
                  }
               });

               S.log(key + ':' + focusHyper);
               slate.bind(key + ':' + focusHyper, function() {
                  if (combo) {
                     S.log('combo add app ' + app);
                     comboApp.push(app);
                  } else {
                     S.log('focus app ' + app);
                     focusApp(app);
                  }
               });
            })(b[0], b[1]);
         }
      };

   var layoutFns = {
      H2: twoAppHorisontal,
      H3: threeAppHorisontal,
      H1V2: threeAppH1V2
   };
   var L = layoutFns;

   leftHalf = moveOp(0, 0, 0.5, 1);
   rightHalf = moveOp(0.5, 0, 0.5, 1);
   left1_3 = moveOp(0, 0, 0.25, 1);
   right2_3 = moveOp(0.25, 0, 0.75, 1);
   left2_5 = moveOp(0, 0, 0.4, 1);
   right3_5 = moveOp(0.4, 0, 0.6, 1);
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
      ['v', MACVIM],
      ['c', CHROME],
      ['i', ITERM],
      ['m', FIREFOX],
      ['p', PHOTOSHOP],
      ['f', FINDER],
      ['x', XCODE],
      ['t', 'SourceTree'],
      ['s', 'Skype'],
      ['y', 'iOS Simulator'],
      ['w', 'WebStorm'],
      // ['n', 'muCommander'],
      ['a', 'Preview'],
      ['z', 'Mail'],
      ['n', ATOM]
   ];

   bindAppsKeys(appBinds, hyperPlus, hyper);

   slate.bind('right:cmd', function() {
      moveOp(0, 0, 0.8, 1);
   });


   slate.bind('left:cmd', function() {
      left2_5.run();
   });

   slate.bind('6:ctrl;alt;cmd', function() {
      moveOp(0, 0, 1, 0.75).run();
      focusApp('iTerm');
      moveOp(0, 0.75, 1, 0.25).run();
      //  moveOp(0, 0, 0.5, 1).run();
   });

   var layouts = [{
      key: 1,
      apps: ['Google Chrome', 'MacVim'],
      layout: 'H2',
      params: [0.5]
   }, {
      key: 2,
      apps: ['Google Chrome', 'MacVim'],
      layout: 'H2',
      params: [0.35]
   }];

   for (var i = 0; i < layouts.length; i++) {
      var l = layouts[i];
      (function(l) {
         slate.bind(l.key + ':ctrl;alt;cmd', function() {
            var appsCount = l.apps.length;
            var params;
            if (combo && appsCount === comboApp.length) {
               params = comboApp.concat(l.params);
               currentApps = comboApp;
            } else {
               params = l.apps.concat(l.params);
               currentApps = l.apps;
            }
            currentParams = l.params;
            currentLayout = l.layout;
            L[l.layout].apply(null, params);
         });

      }(l));
   }

   slate.bind('3:ctrl;alt;cmd', function() {
      twoAppHorisontal('Skype', 'Google Chrome', 0.3);
   });

   slate.bind('4:ctrl;alt;cmd', function() {
      threeAppHorisontal('Google Chrome', 'iTerm', 'MacVim', 0.4, 0.3);
   });
   slate.bind('5:ctrl;alt;cmd', function() {
      threeAppH1V2('Google Chrome', 'iTerm', 'MacVim', 0.5, 0.5);
   });

   slate.bind('h:ctrl;alt;cmd', function() {
      move(0, 0, 0.5, 1);
   });

   slate.bind('l:ctrl;alt;cmd', function() {
      move(0.5, 0, 0.5, 1);
   });


   var startCombo = function() {
      S.log('combo is ON');
      combo = true;
      comboApp = [];
      setTimeout(function() {
         combo = false;
         S.log('combo is OFF');
      }, 3000);
   };

   var swapComboAppSize =  function(){
         S.log('swap');
         S.log(currentLayout, currentApps, currentParams);
         if(currentLayout && currentApps.length){
            // currentApps = currentApps.reverse();
            var newParams = [];
            for(var i = 0, len = currentParams.length; i < len; i++){
                 newParams.push(1 - currentParams[i]);
            }
            currentParams = newParams;
            S.log(newParams, currentParams);
            var params = currentApps.concat(newParams);
            L[currentLayout].apply(null, params);
         }

   };

   slate.bind(',:ctrl;alt;cmd', startCombo);
   slate.bind('.:ctrl;alt;cmd', swapComboAppSize);

})();
