webpackJsonp([4],{IENY:function(t,i){},IinW:function(t,i,e){
/*!
 * Viewer.js v1.4.0
 * https://fengyuanchen.github.io/viewerjs
 *
 * Copyright 2015-present Chen Fengyuan
 * Released under the MIT license
 *
 * Date: 2019-10-26T07:09:40.792Z
 */var n;n=function(){"use strict";function t(i){return(t="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t})(i)}function i(t,i){for(var e=0;e<i.length;e++){var n=i[e];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(t,n.key,n)}}function e(t,i,e){return i in t?Object.defineProperty(t,i,{value:e,enumerable:!0,configurable:!0,writable:!0}):t[i]=e,t}function n(t,i){var e=Object.keys(t);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(t);i&&(n=n.filter(function(i){return Object.getOwnPropertyDescriptor(t,i).enumerable})),e.push.apply(e,n)}return e}function s(t){for(var i=1;i<arguments.length;i++){var s=null!=arguments[i]?arguments[i]:{};i%2?n(s,!0).forEach(function(i){e(t,i,s[i])}):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(s)):n(s).forEach(function(i){Object.defineProperty(t,i,Object.getOwnPropertyDescriptor(s,i))})}return t}var o={backdrop:!0,button:!0,navbar:!0,title:!0,toolbar:!0,className:"",container:"body",filter:null,fullscreen:!0,initialViewIndex:0,inline:!1,interval:5e3,keyboard:!0,loading:!0,loop:!0,minWidth:200,minHeight:100,movable:!0,rotatable:!0,scalable:!0,zoomable:!0,zoomOnTouch:!0,zoomOnWheel:!0,toggleOnDblclick:!0,tooltip:!0,transition:!0,zIndex:2015,zIndexInline:0,zoomRatio:.1,minZoomRatio:.01,maxZoomRatio:100,url:"src",ready:null,show:null,shown:null,hide:null,hidden:null,view:null,viewed:null,zoom:null,zoomed:null},a="undefined"!=typeof window&&void 0!==window.document,r=a?window:{},h=!!a&&"ontouchstart"in r.document.documentElement,l=!!a&&"PointerEvent"in r,c="".concat("viewer","-active"),d="".concat("viewer","-close"),u="".concat("viewer","-fade"),m="".concat("viewer","-fixed"),v="".concat("viewer","-fullscreen"),g="".concat("viewer","-fullscreen-exit"),f="".concat("viewer","-hide"),p="".concat("viewer","-hide-md-down"),w="".concat("viewer","-hide-sm-down"),b="".concat("viewer","-hide-xs-down"),y="".concat("viewer","-in"),k="".concat("viewer","-invisible"),x="".concat("viewer","-loading"),z="".concat("viewer","-move"),D="".concat("viewer","-open"),I="".concat("viewer","-show"),T="".concat("viewer","-transition"),E=l?"pointerdown":h?"touchstart":"mousedown",C=l?"pointermove":h?"touchmove":"mousemove",S=l?"pointerup pointercancel":h?"touchend touchcancel":"mouseup",O="".concat("viewer","Action"),L=/\s\s*/,N=["zoom-in","zoom-out","one-to-one","reset","prev","play","next","rotate-left","rotate-right","flip-horizontal","flip-vertical"];function R(t){return"string"==typeof t}var M=Number.isNaN||r.isNaN;function P(t){return"number"==typeof t&&!M(t)}function _(t){return void 0===t}function Y(i){return"object"===t(i)&&null!==i}var F=Object.prototype.hasOwnProperty;function q(t){if(!Y(t))return!1;try{var i=t.constructor,e=i.prototype;return i&&e&&F.call(e,"isPrototypeOf")}catch(t){return!1}}function X(t){return"function"==typeof t}function A(t,i){if(t&&X(i))if(Array.isArray(t)||P(t.length)){var e,n=t.length;for(e=0;e<n&&!1!==i.call(t,t[e],e,t);e+=1);}else Y(t)&&Object.keys(t).forEach(function(e){i.call(t,t[e],e,t)});return t}var W=Object.assign||function(t){for(var i=arguments.length,e=new Array(i>1?i-1:0),n=1;n<i;n++)e[n-1]=arguments[n];return Y(t)&&e.length>0&&e.forEach(function(i){Y(i)&&Object.keys(i).forEach(function(e){t[e]=i[e]})}),t},j=/^(?:width|height|left|top|marginLeft|marginTop)$/;function H(t,i){var e=t.style;A(i,function(t,i){j.test(i)&&P(t)&&(t+="px"),e[i]=t})}function V(t,i){return!(!t||!i)&&(t.classList?t.classList.contains(i):t.className.indexOf(i)>-1)}function B(t,i){if(t&&i)if(P(t.length))A(t,function(t){B(t,i)});else if(t.classList)t.classList.add(i);else{var e=t.className.trim();e?e.indexOf(i)<0&&(t.className="".concat(e," ").concat(i)):t.className=i}}function $(t,i){t&&i&&(P(t.length)?A(t,function(t){$(t,i)}):t.classList?t.classList.remove(i):t.className.indexOf(i)>=0&&(t.className=t.className.replace(i,"")))}function U(t,i,e){i&&(P(t.length)?A(t,function(t){U(t,i,e)}):e?B(t,i):$(t,i))}var K=/([a-z\d])([A-Z])/g;function Z(t){return t.replace(K,"$1-$2").toLowerCase()}function Q(t,i){return Y(t[i])?t[i]:t.dataset?t.dataset[i]:t.getAttribute("data-".concat(Z(i)))}function J(t,i,e){Y(e)?t[i]=e:t.dataset?t.dataset[i]=e:t.setAttribute("data-".concat(Z(i)),e)}var G=function(){var t=!1;if(a){var i=!1,e=function(){},n=Object.defineProperty({},"once",{get:function(){return t=!0,i},set:function(t){i=t}});r.addEventListener("test",e,n),r.removeEventListener("test",e,n)}return t}();function tt(t,i,e){var n=arguments.length>3&&void 0!==arguments[3]?arguments[3]:{},s=e;i.trim().split(L).forEach(function(i){if(!G){var o=t.listeners;o&&o[i]&&o[i][e]&&(s=o[i][e],delete o[i][e],0===Object.keys(o[i]).length&&delete o[i],0===Object.keys(o).length&&delete t.listeners)}t.removeEventListener(i,s,n)})}function it(t,i,e){var n=arguments.length>3&&void 0!==arguments[3]?arguments[3]:{},s=e;i.trim().split(L).forEach(function(i){if(n.once&&!G){var o=t.listeners,a=void 0===o?{}:o;s=function(){delete a[i][e],t.removeEventListener(i,s,n);for(var o=arguments.length,r=new Array(o),h=0;h<o;h++)r[h]=arguments[h];e.apply(t,r)},a[i]||(a[i]={}),a[i][e]&&t.removeEventListener(i,a[i][e],n),a[i][e]=s,t.listeners=a}t.addEventListener(i,s,n)})}function et(t,i,e){var n;return X(Event)&&X(CustomEvent)?n=new CustomEvent(i,{detail:e,bubbles:!0,cancelable:!0}):(n=document.createEvent("CustomEvent")).initCustomEvent(i,!0,!0,e),t.dispatchEvent(n)}function nt(t){var i=t.rotate,e=t.scaleX,n=t.scaleY,s=t.translateX,o=t.translateY,a=[];P(s)&&0!==s&&a.push("translateX(".concat(s,"px)")),P(o)&&0!==o&&a.push("translateY(".concat(o,"px)")),P(i)&&0!==i&&a.push("rotate(".concat(i,"deg)")),P(e)&&1!==e&&a.push("scaleX(".concat(e,")")),P(n)&&1!==n&&a.push("scaleY(".concat(n,")"));var r=a.length?a.join(" "):"none";return{WebkitTransform:r,msTransform:r,transform:r}}var st=r.navigator&&/(Macintosh|iPhone|iPod|iPad).*AppleWebKit/i.test(r.navigator.userAgent);function ot(t,i){var e=document.createElement("img");if(t.naturalWidth&&!st)return i(t.naturalWidth,t.naturalHeight),e;var n=document.body||document.documentElement;return e.onload=function(){i(e.width,e.height),st||n.removeChild(e)},e.src=t.src,st||(e.style.cssText="left:0;max-height:none!important;max-width:none!important;min-height:0!important;min-width:0!important;opacity:0;position:absolute;top:0;z-index:-1;",n.appendChild(e)),e}function at(t){switch(t){case 2:return b;case 3:return w;case 4:return p;default:return""}}function rt(t,i){var e=t.pageX,n=t.pageY,o={endX:e,endY:n};return i?o:s({timeStamp:Date.now(),startX:e,startY:n},o)}var ht={render:function(){this.initContainer(),this.initViewer(),this.initList(),this.renderViewer()},initContainer:function(){this.containerData={width:window.innerWidth,height:window.innerHeight}},initViewer:function(){var t,i=this.options,e=this.parent;i.inline&&(t={width:Math.max(e.offsetWidth,i.minWidth),height:Math.max(e.offsetHeight,i.minHeight)},this.parentData=t),!this.fulled&&t||(t=this.containerData),this.viewerData=W({},t)},renderViewer:function(){this.options.inline&&!this.fulled&&H(this.viewer,this.viewerData)},initList:function(){var t=this,i=this.element,e=this.options,n=this.list,s=[];n.innerHTML="",A(this.images,function(i,o){var a=i.src,r=i.alt||function(t){return R(t)?decodeURIComponent(t.replace(/^.*\//,"").replace(/[?&#].*$/,"")):""}(a),h=e.url;if(R(h)?h=i.getAttribute(h):X(h)&&(h=h.call(t,i)),a||h){var l=document.createElement("li"),c=document.createElement("img");c.src=a||h,c.alt=r,c.setAttribute("data-index",o),c.setAttribute("data-original-url",h||a),c.setAttribute("data-viewer-action","view"),c.setAttribute("role","button"),l.appendChild(c),n.appendChild(l),s.push(l)}}),this.items=s,A(s,function(i){var n=i.firstElementChild;J(n,"filled",!0),e.loading&&B(i,x),it(n,"load",function(n){e.loading&&$(i,x),t.loadImage(n)},{once:!0})}),e.transition&&it(i,"viewed",function(){B(n,T)},{once:!0})},renderList:function(t){var i=t||this.index,e=this.items[i].offsetWidth||30,n=e+1;H(this.list,W({width:n*this.length},nt({translateX:(this.viewerData.width-e)/2-n*i})))},resetList:function(){var t=this.list;t.innerHTML="",$(t,T),H(t,nt({translateX:0}))},initImage:function(t){var i,e=this,n=this.options,s=this.image,o=this.viewerData,a=this.footer.offsetHeight,r=o.width,h=Math.max(o.height-a,a),l=this.imageData||{};this.imageInitializing={abort:function(){i.onload=null}},i=ot(s,function(i,s){var o=i/s,a=r,c=h;e.imageInitializing=!1,h*o>r?c=r/o:a=h*o;var d={naturalWidth:i,naturalHeight:s,aspectRatio:o,ratio:(a=Math.min(.9*a,i))/i,width:a,height:c=Math.min(.9*c,s),left:(r-a)/2,top:(h-c)/2},u=W({},d);n.rotatable&&(d.rotate=l.rotate||0,u.rotate=0),n.scalable&&(d.scaleX=l.scaleX||1,d.scaleY=l.scaleY||1,u.scaleX=1,u.scaleY=1),e.imageData=d,e.initialImageData=u,t&&t()})},renderImage:function(t){var i=this,e=this.image,n=this.imageData;if(H(e,W({width:n.width,height:n.height,marginLeft:n.left,marginTop:n.top},nt(n))),t)if((this.viewing||this.zooming)&&this.options.transition){var s=function(){i.imageRendering=!1,t()};this.imageRendering={abort:function(){tt(e,"transitionend",s)}},it(e,"transitionend",s,{once:!0})}else t()},resetImage:function(){if(this.viewing||this.viewed){var t=this.image;this.viewing&&this.viewing.abort(),t.parentNode.removeChild(t),this.image=null}}},lt={bind:function(){var t=this.options,i=this.viewer,e=this.canvas,n=this.element.ownerDocument;it(i,"click",this.onClick=this.click.bind(this)),it(i,"dragstart",this.onDragStart=this.dragstart.bind(this)),it(e,E,this.onPointerDown=this.pointerdown.bind(this)),it(n,C,this.onPointerMove=this.pointermove.bind(this)),it(n,S,this.onPointerUp=this.pointerup.bind(this)),it(n,"keydown",this.onKeyDown=this.keydown.bind(this)),it(window,"resize",this.onResize=this.resize.bind(this)),t.zoomable&&t.zoomOnWheel&&it(i,"wheel",this.onWheel=this.wheel.bind(this),{passive:!1,capture:!0}),t.toggleOnDblclick&&it(e,"dblclick",this.onDblclick=this.dblclick.bind(this))},unbind:function(){var t=this.options,i=this.viewer,e=this.canvas,n=this.element.ownerDocument;tt(i,"click",this.onClick),tt(i,"dragstart",this.onDragStart),tt(e,E,this.onPointerDown),tt(n,C,this.onPointerMove),tt(n,S,this.onPointerUp),tt(n,"keydown",this.onKeyDown),tt(window,"resize",this.onResize),t.zoomable&&t.zoomOnWheel&&tt(i,"wheel",this.onWheel,{passive:!1,capture:!0}),t.toggleOnDblclick&&tt(e,"dblclick",this.onDblclick)}},ct={click:function(t){var i=t.target,e=this.options,n=this.imageData,s=Q(i,O);switch(h&&t.isTrusted&&i===this.canvas&&clearTimeout(this.clickCanvasTimeout),s){case"mix":this.played?this.stop():e.inline?this.fulled?this.exit():this.full():this.hide();break;case"hide":this.hide();break;case"view":this.view(Q(i,"index"));break;case"zoom-in":this.zoom(.1,!0);break;case"zoom-out":this.zoom(-.1,!0);break;case"one-to-one":this.toggle();break;case"reset":this.reset();break;case"prev":this.prev(e.loop);break;case"play":this.play(e.fullscreen);break;case"next":this.next(e.loop);break;case"rotate-left":this.rotate(-90);break;case"rotate-right":this.rotate(90);break;case"flip-horizontal":this.scaleX(-n.scaleX||-1);break;case"flip-vertical":this.scaleY(-n.scaleY||-1);break;default:this.played&&this.stop()}},dblclick:function(t){t.preventDefault(),this.viewed&&t.target===this.image&&(h&&t.isTrusted&&clearTimeout(this.doubleClickImageTimeout),this.toggle())},load:function(){var t=this;this.timeout&&(clearTimeout(this.timeout),this.timeout=!1);var i=this.element,e=this.options,n=this.image,s=this.index,o=this.viewerData;$(n,k),e.loading&&$(this.canvas,x),n.style.cssText="height:0;"+"margin-left:".concat(o.width/2,"px;")+"margin-top:".concat(o.height/2,"px;")+"max-width:none!important;position:absolute;width:0;",this.initImage(function(){U(n,z,e.movable),U(n,T,e.transition),t.renderImage(function(){t.viewed=!0,t.viewing=!1,X(e.viewed)&&it(i,"viewed",e.viewed,{once:!0}),et(i,"viewed",{originalImage:t.images[s],index:s,image:n})})})},loadImage:function(t){var i=t.target,e=i.parentNode,n=e.offsetWidth||30,s=e.offsetHeight||50,o=!!Q(i,"filled");ot(i,function(t,e){var a=t/e,r=n,h=s;s*a>n?o?r=s*a:h=n/a:o?h=n/a:r=s*a,H(i,W({width:r,height:h},nt({translateX:(n-r)/2,translateY:(s-h)/2})))})},keydown:function(t){var i=this.options;if(this.fulled&&i.keyboard)switch(t.keyCode||t.which||t.charCode){case 27:this.played?this.stop():i.inline?this.fulled&&this.exit():this.hide();break;case 32:this.played&&this.stop();break;case 37:this.prev(i.loop);break;case 38:t.preventDefault(),this.zoom(i.zoomRatio,!0);break;case 39:this.next(i.loop);break;case 40:t.preventDefault(),this.zoom(-i.zoomRatio,!0);break;case 48:case 49:t.ctrlKey&&(t.preventDefault(),this.toggle())}},dragstart:function(t){"img"===t.target.tagName.toLowerCase()&&t.preventDefault()},pointerdown:function(t){var i=this.options,e=this.pointers,n=t.buttons,s=t.button;if(!(!this.viewed||this.showing||this.viewing||this.hiding||("mousedown"===t.type||"pointerdown"===t.type&&"mouse"===t.pointerType)&&(P(n)&&1!==n||P(s)&&0!==s||t.ctrlKey))){t.preventDefault(),t.changedTouches?A(t.changedTouches,function(t){e[t.identifier]=rt(t)}):e[t.pointerId||0]=rt(t);var o=!!i.movable&&"move";Object.keys(e).length>1&&i.zoomable&&i.zoomOnTouch?o="zoom":"touch"!==t.pointerType&&"touchstart"!==t.type||!this.isSwitchable()||(o="switch"),!i.transition||"move"!==o&&"zoom"!==o||$(this.image,T),this.action=o}},pointermove:function(t){var i=this.pointers,e=this.action;this.viewed&&e&&(t.preventDefault(),t.changedTouches?A(t.changedTouches,function(t){W(i[t.identifier]||{},rt(t,!0))}):W(i[t.pointerId||0]||{},rt(t,!0)),this.change(t))},pointerup:function(t){var i,e=this,n=this.options,s=this.action,o=this.pointers;t.changedTouches?A(t.changedTouches,function(t){i=o[t.identifier],delete o[t.identifier]}):(i=o[t.pointerId||0],delete o[t.pointerId||0]),s&&(t.preventDefault(),!n.transition||"move"!==s&&"zoom"!==s||B(this.image,T),this.action=!1,h&&"zoom"!==s&&i&&Date.now()-i.timeStamp<500&&(clearTimeout(this.clickCanvasTimeout),clearTimeout(this.doubleClickImageTimeout),n.toggleOnDblclick&&this.viewed&&t.target===this.image?this.imageClicked?(this.imageClicked=!1,this.doubleClickImageTimeout=setTimeout(function(){et(e.image,"dblclick")},50)):(this.imageClicked=!0,this.doubleClickImageTimeout=setTimeout(function(){e.imageClicked=!1},500)):(this.imageClicked=!1,n.backdrop&&"static"!==n.backdrop&&t.target===this.canvas&&(this.clickCanvasTimeout=setTimeout(function(){et(e.canvas,"click")},50)))))},resize:function(){var t=this;if(this.isShown&&!this.hiding&&(this.initContainer(),this.initViewer(),this.renderViewer(),this.renderList(),this.viewed&&this.initImage(function(){t.renderImage()}),this.played)){if(this.options.fullscreen&&this.fulled&&!(document.fullscreenElement||document.webkitFullscreenElement||document.mozFullScreenElement||document.msFullscreenElement))return void this.stop();A(this.player.getElementsByTagName("img"),function(i){it(i,"load",t.loadImage.bind(t),{once:!0}),et(i,"load")})}},wheel:function(t){var i=this;if(this.viewed&&(t.preventDefault(),!this.wheeling)){this.wheeling=!0,setTimeout(function(){i.wheeling=!1},50);var e=Number(this.options.zoomRatio)||.1,n=1;t.deltaY?n=t.deltaY>0?1:-1:t.wheelDelta?n=-t.wheelDelta/120:t.detail&&(n=t.detail>0?1:-1),this.zoom(-n*e,!0,t)}}},dt={show:function(){var t=arguments.length>0&&void 0!==arguments[0]&&arguments[0],i=this.element,e=this.options;if(e.inline||this.showing||this.isShown||this.showing)return this;if(!this.ready)return this.build(),this.ready&&this.show(t),this;if(X(e.show)&&it(i,"show",e.show,{once:!0}),!1===et(i,"show")||!this.ready)return this;this.hiding&&this.transitioning.abort(),this.showing=!0,this.open();var n=this.viewer;if($(n,f),e.transition&&!t){var s=this.shown.bind(this);this.transitioning={abort:function(){tt(n,"transitionend",s),$(n,y)}},B(n,T),n.offsetWidth,it(n,"transitionend",s,{once:!0}),B(n,y)}else B(n,y),this.shown();return this},hide:function(){var t=arguments.length>0&&void 0!==arguments[0]&&arguments[0],i=this.element,e=this.options;if(e.inline||this.hiding||!this.isShown&&!this.showing)return this;if(X(e.hide)&&it(i,"hide",e.hide,{once:!0}),!1===et(i,"hide"))return this;this.showing&&this.transitioning.abort(),this.hiding=!0,this.played?this.stop():this.viewing&&this.viewing.abort();var n=this.viewer;if(e.transition&&!t){var s=this.hidden.bind(this),o=function(){setTimeout(function(){it(n,"transitionend",s,{once:!0}),$(n,y)},0)};this.transitioning={abort:function(){this.viewed?tt(this.image,"transitionend",o):tt(n,"transitionend",s)}},this.viewed&&V(this.image,T)?(it(this.image,"transitionend",o,{once:!0}),this.zoomTo(0,!1,!1,!0)):o()}else $(n,y),this.hidden();return this},view:function(){var t=this,i=arguments.length>0&&void 0!==arguments[0]?arguments[0]:this.options.initialViewIndex;if(i=Number(i)||0,this.hiding||this.played||i<0||i>=this.length||this.viewed&&i===this.index)return this;if(!this.isShown)return this.index=i,this.show();this.viewing&&this.viewing.abort();var e=this.element,n=this.options,s=this.title,o=this.canvas,a=this.items[i],r=a.querySelector("img"),h=Q(r,"originalUrl"),l=r.getAttribute("alt"),d=document.createElement("img");if(d.src=h,d.alt=l,X(n.view)&&it(e,"view",n.view,{once:!0}),!1===et(e,"view",{originalImage:this.images[i],index:i,image:d})||!this.isShown||this.hiding||this.played)return this;this.image=d,$(this.items[this.index],c),B(a,c),this.viewed=!1,this.index=i,this.imageData={},B(d,k),n.loading&&B(o,x),o.innerHTML="",o.appendChild(d),this.renderList(),s.innerHTML="";var u,m=function(){var i,e=t.imageData,o=Array.isArray(n.title)?n.title[1]:n.title;s.innerHTML=R(i=X(o)?o.call(t,d,e):"".concat(l," (").concat(e.naturalWidth," × ").concat(e.naturalHeight,")"))?i.replace(/&(?!amp;|quot;|#39;|lt;|gt;)/g,"&amp;").replace(/"/g,"&quot;").replace(/'/g,"&#39;").replace(/</g,"&lt;").replace(/>/g,"&gt;"):i};return it(e,"viewed",m,{once:!0}),this.viewing={abort:function(){tt(e,"viewed",m),d.complete?this.imageRendering?this.imageRendering.abort():this.imageInitializing&&this.imageInitializing.abort():(d.src="",tt(d,"load",u),this.timeout&&clearTimeout(this.timeout))}},d.complete?this.load():(it(d,"load",u=this.load.bind(this),{once:!0}),this.timeout&&clearTimeout(this.timeout),this.timeout=setTimeout(function(){$(d,k),t.timeout=!1},1e3)),this},prev:function(){var t=arguments.length>0&&void 0!==arguments[0]&&arguments[0],i=this.index-1;return i<0&&(i=t?this.length-1:0),this.view(i),this},next:function(){var t=arguments.length>0&&void 0!==arguments[0]&&arguments[0],i=this.length-1,e=this.index+1;return e>i&&(e=t?0:i),this.view(e),this},move:function(t,i){var e=this.imageData;return this.moveTo(_(t)?t:e.left+Number(t),_(i)?i:e.top+Number(i)),this},moveTo:function(t){var i=arguments.length>1&&void 0!==arguments[1]?arguments[1]:t,e=this.imageData;if(t=Number(t),i=Number(i),this.viewed&&!this.played&&this.options.movable){var n=!1;P(t)&&(e.left=t,n=!0),P(i)&&(e.top=i,n=!0),n&&this.renderImage()}return this},zoom:function(t){var i=arguments.length>1&&void 0!==arguments[1]&&arguments[1],e=arguments.length>2&&void 0!==arguments[2]?arguments[2]:null,n=this.imageData;return t=(t=Number(t))<0?1/(1-t):1+t,this.zoomTo(n.width*t/n.naturalWidth,i,e),this},zoomTo:function(t){var i=this,e=arguments.length>1&&void 0!==arguments[1]&&arguments[1],n=arguments.length>2&&void 0!==arguments[2]?arguments[2]:null,s=arguments.length>3&&void 0!==arguments[3]&&arguments[3],o=this.element,a=this.options,r=this.pointers,h=this.imageData,l=h.width,c=h.height,d=h.left,u=h.top,m=h.naturalWidth,v=h.naturalHeight;if(P(t=Math.max(0,t))&&this.viewed&&!this.played&&(s||a.zoomable)){if(!s){var g=Math.max(.01,a.minZoomRatio),f=Math.min(100,a.maxZoomRatio);t=Math.min(Math.max(t,g),f)}n&&t>.95&&t<1.05&&(t=1);var p=m*t,w=v*t,b=p-l,y=w-c,k=l/m;if(X(a.zoom)&&it(o,"zoom",a.zoom,{once:!0}),!1===et(o,"zoom",{ratio:t,oldRatio:k,originalEvent:n}))return this;if(this.zooming=!0,n){var x=function(t){var i=t.getBoundingClientRect();return{left:i.left+(window.pageXOffset-document.documentElement.clientLeft),top:i.top+(window.pageYOffset-document.documentElement.clientTop)}}(this.viewer),z=r&&Object.keys(r).length?function(t){var i=0,e=0,n=0;return A(t,function(t){var s=t.startX,o=t.startY;i+=s,e+=o,n+=1}),{pageX:i/=n,pageY:e/=n}}(r):{pageX:n.pageX,pageY:n.pageY};h.left-=b*((z.pageX-x.left-d)/l),h.top-=y*((z.pageY-x.top-u)/c)}else h.left-=b/2,h.top-=y/2;h.width=p,h.height=w,h.ratio=t,this.renderImage(function(){i.zooming=!1,X(a.zoomed)&&it(o,"zoomed",a.zoomed,{once:!0}),et(o,"zoomed",{ratio:t,oldRatio:k,originalEvent:n})}),e&&this.tooltip()}return this},rotate:function(t){return this.rotateTo((this.imageData.rotate||0)+Number(t)),this},rotateTo:function(t){var i=this.imageData;return P(t=Number(t))&&this.viewed&&!this.played&&this.options.rotatable&&(i.rotate=t,this.renderImage()),this},scaleX:function(t){return this.scale(t,this.imageData.scaleY),this},scaleY:function(t){return this.scale(this.imageData.scaleX,t),this},scale:function(t){var i=arguments.length>1&&void 0!==arguments[1]?arguments[1]:t,e=this.imageData;if(t=Number(t),i=Number(i),this.viewed&&!this.played&&this.options.scalable){var n=!1;P(t)&&(e.scaleX=t,n=!0),P(i)&&(e.scaleY=i,n=!0),n&&this.renderImage()}return this},play:function(){var t=this,i=arguments.length>0&&void 0!==arguments[0]&&arguments[0];if(!this.isShown||this.played)return this;var e=this.options,n=this.player,s=this.loadImage.bind(this),o=[],a=0,r=0;if(this.played=!0,this.onLoadWhenPlay=s,i&&this.requestFullscreen(),B(n,I),A(this.items,function(t,i){var h=t.querySelector("img"),l=document.createElement("img");l.src=Q(h,"originalUrl"),l.alt=h.getAttribute("alt"),a+=1,B(l,u),U(l,T,e.transition),V(t,c)&&(B(l,y),r=i),o.push(l),it(l,"load",s,{once:!0}),n.appendChild(l)}),P(e.interval)&&e.interval>0){var h=function i(){t.playing=setTimeout(function(){$(o[r],y),B(o[r=(r+=1)<a?r:0],y),i()},e.interval)};a>1&&h()}return this},stop:function(){var t=this;if(!this.played)return this;var i=this.player;return this.played=!1,clearTimeout(this.playing),A(i.getElementsByTagName("img"),function(i){tt(i,"load",t.onLoadWhenPlay)}),$(i,I),i.innerHTML="",this.exitFullscreen(),this},full:function(){var t=this,i=this.options,e=this.viewer,n=this.image,s=this.list;return!this.isShown||this.played||this.fulled||!i.inline?this:(this.fulled=!0,this.open(),B(this.button,g),i.transition&&($(s,T),this.viewed&&$(n,T)),B(e,m),e.setAttribute("style",""),H(e,{zIndex:i.zIndex}),this.initContainer(),this.viewerData=W({},this.containerData),this.renderList(),this.viewed&&this.initImage(function(){t.renderImage(function(){i.transition&&setTimeout(function(){B(n,T),B(s,T)},0)})}),this)},exit:function(){var t=this,i=this.options,e=this.viewer,n=this.image,s=this.list;return this.isShown&&!this.played&&this.fulled&&i.inline?(this.fulled=!1,this.close(),$(this.button,g),i.transition&&($(s,T),this.viewed&&$(n,T)),$(e,m),H(e,{zIndex:i.zIndexInline}),this.viewerData=W({},this.parentData),this.renderViewer(),this.renderList(),this.viewed&&this.initImage(function(){t.renderImage(function(){i.transition&&setTimeout(function(){B(n,T),B(s,T)},0)})}),this):this},tooltip:function(){var t=this,i=this.options,e=this.tooltipBox,n=this.imageData;return this.viewed&&!this.played&&i.tooltip?(e.textContent="".concat(Math.round(100*n.ratio),"%"),this.tooltipping?clearTimeout(this.tooltipping):i.transition?(this.fading&&et(e,"transitionend"),B(e,I),B(e,u),B(e,T),e.offsetWidth,B(e,y)):B(e,I),this.tooltipping=setTimeout(function(){i.transition?(it(e,"transitionend",function(){$(e,I),$(e,u),$(e,T),t.fading=!1},{once:!0}),$(e,y),t.fading=!0):$(e,I),t.tooltipping=!1},1e3),this):this},toggle:function(){return 1===this.imageData.ratio?this.zoomTo(this.initialImageData.ratio,!0):this.zoomTo(1,!0),this},reset:function(){return this.viewed&&!this.played&&(this.imageData=W({},this.initialImageData),this.renderImage()),this},update:function(){var t=this.element,i=this.options,e=this.isImg;if(e&&!t.parentNode)return this.destroy();var n=[];if(A(e?[t]:t.querySelectorAll("img"),function(t){i.filter?i.filter(t)&&n.push(t):n.push(t)}),!n.length)return this;if(this.images=n,this.length=n.length,this.ready){var s=[];if(A(this.items,function(t,i){var e=t.querySelector("img"),o=n[i];o?o.src!==e.src&&s.push(i):s.push(i)}),H(this.list,{width:"auto"}),this.initList(),this.isShown)if(this.length){if(this.viewed){var o=s.indexOf(this.index);o>=0?(this.viewed=!1,this.view(Math.max(this.index-(o+1),0))):B(this.items[this.index],c)}}else this.image=null,this.viewed=!1,this.index=0,this.imageData={},this.canvas.innerHTML="",this.title.innerHTML=""}else this.build();return this},destroy:function(){var t=this.element,i=this.options;return t.viewer?(this.destroyed=!0,this.ready?(this.played&&this.stop(),i.inline?(this.fulled&&this.exit(),this.unbind()):this.isShown?(this.viewing&&(this.imageRendering?this.imageRendering.abort():this.imageInitializing&&this.imageInitializing.abort()),this.hiding&&this.transitioning.abort(),this.hidden()):this.showing&&(this.transitioning.abort(),this.hidden()),this.ready=!1,this.viewer.parentNode.removeChild(this.viewer)):i.inline&&(this.delaying?this.delaying.abort():this.initializing&&this.initializing.abort()),i.inline||tt(t,"click",this.onStart),t.viewer=void 0,this):this}},ut={open:function(){var t=this.body;B(t,D),t.style.paddingRight="".concat(this.scrollbarWidth+(parseFloat(this.initialBodyPaddingRight)||0),"px")},close:function(){var t=this.body;$(t,D),t.style.paddingRight=this.initialBodyPaddingRight},shown:function(){var t=this.element,i=this.options;this.fulled=!0,this.isShown=!0,this.render(),this.bind(),this.showing=!1,X(i.shown)&&it(t,"shown",i.shown,{once:!0}),!1!==et(t,"shown")&&this.ready&&this.isShown&&!this.hiding&&this.view(this.index)},hidden:function(){var t=this.element,i=this.options;this.fulled=!1,this.viewed=!1,this.isShown=!1,this.close(),this.unbind(),B(this.viewer,f),this.resetList(),this.resetImage(),this.hiding=!1,this.destroyed||(X(i.hidden)&&it(t,"hidden",i.hidden,{once:!0}),et(t,"hidden"))},requestFullscreen:function(){var t=this.element.ownerDocument;if(this.fulled&&!(t.fullscreenElement||t.webkitFullscreenElement||t.mozFullScreenElement||t.msFullscreenElement)){var i=t.documentElement;i.requestFullscreen?i.requestFullscreen():i.webkitRequestFullscreen?i.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT):i.mozRequestFullScreen?i.mozRequestFullScreen():i.msRequestFullscreen&&i.msRequestFullscreen()}},exitFullscreen:function(){var t=this.element.ownerDocument;this.fulled&&(t.fullscreenElement||t.webkitFullscreenElement||t.mozFullScreenElement||t.msFullscreenElement)&&(t.exitFullscreen?t.exitFullscreen():t.webkitExitFullscreen?t.webkitExitFullscreen():t.mozCancelFullScreen?t.mozCancelFullScreen():t.msExitFullscreen&&t.msExitFullscreen())},change:function(t){var i=this.options,e=this.pointers,n=e[Object.keys(e)[0]],o=n.endX-n.startX,a=n.endY-n.startY;switch(this.action){case"move":this.move(o,a);break;case"zoom":this.zoom(function(t){var i=s({},t),e=[];return A(t,function(t,n){delete i[n],A(i,function(i){var n=Math.abs(t.startX-i.startX),s=Math.abs(t.startY-i.startY),o=Math.abs(t.endX-i.endX),a=Math.abs(t.endY-i.endY),r=Math.sqrt(n*n+s*s),h=(Math.sqrt(o*o+a*a)-r)/r;e.push(h)})}),e.sort(function(t,i){return Math.abs(t)<Math.abs(i)}),e[0]}(e),!1,t);break;case"switch":this.action="switched";var r=Math.abs(o);r>1&&r>Math.abs(a)&&(this.pointers={},o>1?this.prev(i.loop):o<-1&&this.next(i.loop))}A(e,function(t){t.startX=t.endX,t.startY=t.endY})},isSwitchable:function(){var t=this.imageData,i=this.viewerData;return this.length>1&&t.left>=0&&t.top>=0&&t.width<=i.width&&t.height<=i.height}},mt=r.Viewer,vt=function(){function t(i){var e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{};if(function(t,i){if(!(t instanceof i))throw new TypeError("Cannot call a class as a function")}(this,t),!i||1!==i.nodeType)throw new Error("The first argument is required and must be an element.");this.element=i,this.options=W({},o,q(e)&&e),this.action=!1,this.fading=!1,this.fulled=!1,this.hiding=!1,this.imageClicked=!1,this.imageData={},this.index=this.options.initialViewIndex,this.isImg=!1,this.isShown=!1,this.length=0,this.played=!1,this.playing=!1,this.pointers={},this.ready=!1,this.showing=!1,this.timeout=!1,this.tooltipping=!1,this.viewed=!1,this.viewing=!1,this.wheeling=!1,this.zooming=!1,this.init()}var e,n,s;return e=t,s=[{key:"noConflict",value:function(){return window.Viewer=mt,t}},{key:"setDefaults",value:function(t){W(o,q(t)&&t)}}],(n=[{key:"init",value:function(){var t=this,i=this.element,e=this.options;if(!i.viewer){i.viewer=this;var n="img"===i.tagName.toLowerCase(),s=[];A(n?[i]:i.querySelectorAll("img"),function(i){X(e.filter)?e.filter.call(t,i)&&s.push(i):s.push(i)}),this.isImg=n,this.length=s.length,this.images=s;var o=i.ownerDocument,a=o.body||o.documentElement;if(this.body=a,this.scrollbarWidth=window.innerWidth-o.documentElement.clientWidth,this.initialBodyPaddingRight=window.getComputedStyle(a).paddingRight,_(document.createElement("viewer").style.transition)&&(e.transition=!1),e.inline){var r=0,h=function(){var i;(r+=1)===t.length&&(t.initializing=!1,t.delaying={abort:function(){clearTimeout(i)}},i=setTimeout(function(){t.delaying=!1,t.build()},0))};this.initializing={abort:function(){A(s,function(t){t.complete||tt(t,"load",h)})}},A(s,function(t){t.complete?h():it(t,"load",h,{once:!0})})}else it(i,"click",this.onStart=function(i){var n=i.target;"img"!==n.tagName.toLowerCase()||X(e.filter)&&!e.filter.call(t,n)||t.view(t.images.indexOf(n))})}}},{key:"build",value:function(){if(!this.ready){var t=this.element,i=this.options,e=t.parentNode,n=document.createElement("div");n.innerHTML='<div class="viewer-container" touch-action="none"><div class="viewer-canvas"></div><div class="viewer-footer"><div class="viewer-title"></div><div class="viewer-toolbar"></div><div class="viewer-navbar"><ul class="viewer-list"></ul></div></div><div class="viewer-tooltip"></div><div role="button" class="viewer-button" data-viewer-action="mix"></div><div class="viewer-player"></div></div>';var s=n.querySelector(".".concat("viewer","-container")),o=s.querySelector(".".concat("viewer","-title")),a=s.querySelector(".".concat("viewer","-toolbar")),r=s.querySelector(".".concat("viewer","-navbar")),h=s.querySelector(".".concat("viewer","-button")),l=s.querySelector(".".concat("viewer","-canvas"));if(this.parent=e,this.viewer=s,this.title=o,this.toolbar=a,this.navbar=r,this.button=h,this.canvas=l,this.footer=s.querySelector(".".concat("viewer","-footer")),this.tooltipBox=s.querySelector(".".concat("viewer","-tooltip")),this.player=s.querySelector(".".concat("viewer","-player")),this.list=s.querySelector(".".concat("viewer","-list")),B(o,i.title?at(Array.isArray(i.title)?i.title[0]:i.title):f),B(r,i.navbar?at(i.navbar):f),U(h,f,!i.button),i.backdrop&&(B(s,"".concat("viewer","-backdrop")),i.inline||"static"===i.backdrop||J(l,O,"hide")),R(i.className)&&i.className&&i.className.split(L).forEach(function(t){B(s,t)}),i.toolbar){var c=document.createElement("ul"),g=q(i.toolbar),p=N.slice(0,3),w=N.slice(7,9),b=N.slice(9);g||B(a,at(i.toolbar)),A(g?i.toolbar:N,function(t,e){var n=g&&q(t),s=g?Z(e):t,o=n&&!_(t.show)?t.show:t;if(o&&(i.zoomable||-1===p.indexOf(s))&&(i.rotatable||-1===w.indexOf(s))&&(i.scalable||-1===b.indexOf(s))){var a=n&&!_(t.size)?t.size:t,r=n&&!_(t.click)?t.click:t,h=document.createElement("li");h.setAttribute("role","button"),B(h,"".concat("viewer","-").concat(s)),X(r)||J(h,O,s),P(o)&&B(h,at(o)),-1!==["small","large"].indexOf(a)?B(h,"".concat("viewer","-").concat(a)):"play"===s&&B(h,"".concat("viewer","-large")),X(r)&&it(h,"click",r),c.appendChild(h)}}),a.appendChild(c)}else B(a,f);if(!i.rotatable){var y=a.querySelectorAll('li[class*="rotate"]');B(y,k),A(y,function(t){a.appendChild(t)})}if(i.inline)B(h,v),H(s,{zIndex:i.zIndexInline}),"static"===window.getComputedStyle(e).position&&H(e,{position:"relative"}),e.insertBefore(s,t.nextSibling);else{B(h,d),B(s,m),B(s,u),B(s,f),H(s,{zIndex:i.zIndex});var x=i.container;R(x)&&(x=t.ownerDocument.querySelector(x)),x||(x=this.body),x.appendChild(s)}i.inline&&(this.render(),this.bind(),this.isShown=!0),this.ready=!0,X(i.ready)&&it(t,"ready",i.ready,{once:!0}),!1!==et(t,"ready")?this.ready&&i.inline&&this.view(this.index):this.ready=!1}}}])&&i(e.prototype,n),s&&i(e,s),t}();return W(vt.prototype,ht,lt,ct,dt,ut),vt},t.exports=n()},N1kN:function(t,i){},sQQC:function(t,i,e){"use strict";Object.defineProperty(i,"__esModule",{value:!0});var n=e("IinW"),s=e.n(n),o=(e("N1kN"),{data:function(){return{postList:"",viewer:""}},inject:["reload"],mounted:function(){this.getPostList()},methods:{getPostList:function(){var t=this,i=sessionStorage.getItem("username");this.$store.dispatch("msg/getReadableMsg",i).then(function(i){t.postList=i.obj})},getPostDetail:function(t){this.$router.push("/msg/postDetail/"+t)},enlarge:function(t){console.log(t);var i=document.getElementById(t);this.viewer=new s.a(i,{initialViewIndex:0,button:!0,navbar:2,title:0,toolbar:1,keyboard:!0})},deletePost:function(t){var i=this,e=sessionStorage.getItem("username");this.$store.dispatch("msg/deletePost",{postId:t,userId:e}).then(function(t){i.$store.dispatch("msg/getUnReadMsgCountByUser").then(function(t){i.$store.state.msg.currCount=t}),200==t.status&&(i.$message({message:"删除成功",type:"success"}),i.reload())})},active:function(t){for(var i=document.getElementsByClassName("post"),e=0;e<i.length;e++)i[e].classList.remove("activeDiv");t.currentTarget.classList.add("activeDiv")}}}),a={render:function(){var t=this,i=t.$createElement,e=t._self._c||i;return e("div",{staticClass:"postList"},[e("div",{staticStyle:{height:"50px",width:"100%",background:"#D9ECFF",padding:"13px"}},[t._v("\n    信息列表\n  ")]),t._v(" "),e("div",{staticClass:"roof"}),t._v(" "),e("div",{staticClass:"posts"},t._l(t.postList,function(i,n){return e("div",{key:i.postid,staticClass:"post"},[e("div",{staticClass:"userInfoArea"},[e("div",{staticClass:"title",on:{click:function(e){return t.getPostDetail(i.postid)}}},[1==i.isRead?e("el-tag",{attrs:{type:"success"}},[t._v("已读")]):t._e(),t._v(" "),0==i.isRead?e("el-tag",{attrs:{type:"warning"}},[t._v("未读")]):t._e(),t._v("\n          "+t._s(t._f("ellipsis")(i.title))+"\n        ")],1),t._v(" "),e("div",{staticClass:"author"},[t._v("\n          "+t._s(i.userinfo.name)+"\n        ")])]),t._v(" "),e("div",{staticClass:"postInfoArea"},[e("div",{staticClass:"content",staticStyle:{width:"80%",float:"left"}},[t._v("\n          "+t._s(t._f("ellipsis")(i.content))+"\n        ")]),t._v(" "),e("div",{staticClass:"time"},[t._v("\n          "+t._s(i.posttime)+"\n        ")])]),t._v(" "),""!=i.imglist?e("div",{attrs:{id:i.postid},on:{click:function(e){return t.enlarge(i.postid)}}},t._l(i.imglist.split(","),function(i,n){return n<5?e("img",{staticStyle:{"margin-right":"10px",cursor:"zoom-in"},attrs:{src:i,width:"100px",height:"100px"}}):t._e()}),0):t._e(),t._v(" "),e("div",{staticClass:"operation",staticStyle:{width:"100%",height:"50px"}},[e("div",{staticStyle:{float:"right"}},[e("el-button",{attrs:{type:"success",plain:""}},[t._v("收藏")]),t._v(" "),e("el-button",{attrs:{type:"danger",plain:""},on:{click:function(e){return t.deletePost(i.postid)}}},[t._v("删除")])],1)])])}),0)])},staticRenderFns:[]};var r=e("VU/8")(o,a,!1,function(t){e("IENY")},"data-v-4421e378",null);i.default=r.exports}});
//# sourceMappingURL=4.148a3d66444cbb32fc38.js.map