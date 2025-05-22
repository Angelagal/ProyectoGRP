function org_opentaps_gwt_crmsfa_crmsfa(){
  var $wnd_0 = window, $doc_0 = document, $stats = $wnd_0.__gwtStatsEvent?function(a){
    return $wnd_0.__gwtStatsEvent(a);
  }
  :null, $sessionId_0 = $wnd_0.__gwtStatsSessionId?$wnd_0.__gwtStatsSessionId:null, scriptsDone, loadDone, bodyDone, base = '', metaProps = {}, values = [], providers = [], answers = [], softPermutationId = 0, onLoadErrorFunc, propertyErrorFunc;
  $stats && $stats({moduleName:'org.opentaps.gwt.crmsfa.crmsfa', sessionId:$sessionId_0, subSystem:'startup', evtGroup:'bootstrap', millis:(new Date).getTime(), type:'begin'});
  if (!$wnd_0.__gwt_stylesLoaded) {
    $wnd_0.__gwt_stylesLoaded = {};
  }
  if (!$wnd_0.__gwt_scriptsLoaded) {
    $wnd_0.__gwt_scriptsLoaded = {};
  }
  function isHostedMode(){
    var result = false;
    try {
      var query = $wnd_0.location.search;
      return (query.indexOf('gwt.codesvr=') != -1 || (query.indexOf('gwt.hosted=') != -1 || $wnd_0.external && $wnd_0.external.gwtOnLoad)) && query.indexOf('gwt.hybrid') == -1;
    }
     catch (e) {
    }
    isHostedMode = function(){
      return result;
    }
    ;
    return result;
  }

  function maybeStartModule(){
    if (scriptsDone && loadDone) {
      var iframe = $doc_0.getElementById('org.opentaps.gwt.crmsfa.crmsfa');
      var frameWnd = iframe.contentWindow;
      if (isHostedMode()) {
        frameWnd.__gwt_getProperty = function(name_0){
          return computePropValue(name_0);
        }
        ;
      }
      org_opentaps_gwt_crmsfa_crmsfa = null;
      frameWnd.gwtOnLoad(onLoadErrorFunc, 'org.opentaps.gwt.crmsfa.crmsfa', base, softPermutationId);
      $stats && $stats({moduleName:'org.opentaps.gwt.crmsfa.crmsfa', sessionId:$sessionId_0, subSystem:'startup', evtGroup:'moduleStartup', millis:(new Date).getTime(), type:'end'});
    }
  }

  function computeScriptBase(){
    if (metaProps['baseUrl']) {
      base = metaProps['baseUrl'];
      return base;
    }
    var thisScript;
    var scriptTags = $doc_0.getElementsByTagName('script');
    for (var i = 0; i < scriptTags.length; ++i) {
      if (scriptTags[i].src.indexOf('org.opentaps.gwt.crmsfa.crmsfa.nocache.js') != -1) {
        thisScript = scriptTags[i];
      }
    }
    if (!thisScript) {
      var markerId = '__gwt_marker_org.opentaps.gwt.crmsfa.crmsfa';
      var markerScript;
      $doc_0.write('<script id="' + markerId + '"><\/script>');
      markerScript = $doc_0.getElementById(markerId);
      thisScript = markerScript && markerScript.previousSibling;
      while (thisScript && thisScript.tagName != 'SCRIPT') {
        thisScript = thisScript.previousSibling;
      }
    }
    function getDirectoryOfFile(path){
      var hashIndex = path.lastIndexOf('#');
      if (hashIndex == -1) {
        hashIndex = path.length;
      }
      var queryIndex = path.indexOf('?');
      if (queryIndex == -1) {
        queryIndex = path.length;
      }
      var slashIndex = path.lastIndexOf('/', Math.min(queryIndex, hashIndex));
      return slashIndex >= 0?path.substring(0, slashIndex + 1):'';
    }

    ;
    if (thisScript && thisScript.src) {
      base = getDirectoryOfFile(thisScript.src);
    }
    if (base == '') {
      var baseElements = $doc_0.getElementsByTagName('base');
      if (baseElements.length > 0) {
        base = baseElements[baseElements.length - 1].href;
      }
       else {
        base = getDirectoryOfFile($doc_0.location.href);
      }
    }
     else if (base.match(/^\w+:\/\//)) {
    }
     else {
      var img = $doc_0.createElement('img');
      img.src = base + 'clear.cache.gif';
      base = getDirectoryOfFile(img.src);
    }
    if (markerScript) {
      markerScript.parentNode.removeChild(markerScript);
    }
    return base;
  }

  function processMetas(){
    var metas = document.getElementsByTagName('meta');
    for (var i = 0, n = metas.length; i < n; ++i) {
      var meta = metas[i], name_0 = meta.getAttribute('name'), content_0;
      if (name_0) {
        name_0 = name_0.replace('org.opentaps.gwt.crmsfa.crmsfa::', '');
        if (name_0.indexOf('::') >= 0) {
          continue;
        }
        if (name_0 == 'gwt:property') {
          content_0 = meta.getAttribute('content');
          if (content_0) {
            var value, eq = content_0.indexOf('=');
            if (eq >= 0) {
              name_0 = content_0.substring(0, eq);
              value = content_0.substring(eq + 1);
            }
             else {
              name_0 = content_0;
              value = '';
            }
            metaProps[name_0] = value;
          }
        }
         else if (name_0 == 'gwt:onPropertyErrorFn') {
          content_0 = meta.getAttribute('content');
          if (content_0) {
            try {
              propertyErrorFunc = eval(content_0);
            }
             catch (e) {
              alert('Bad handler "' + content_0 + '" for "gwt:onPropertyErrorFn"');
            }
          }
        }
         else if (name_0 == 'gwt:onLoadErrorFn') {
          content_0 = meta.getAttribute('content');
          if (content_0) {
            try {
              onLoadErrorFunc = eval(content_0);
            }
             catch (e) {
              alert('Bad handler "' + content_0 + '" for "gwt:onLoadErrorFn"');
            }
          }
        }
      }
    }
  }

  function __gwt_isKnownPropertyValue(propName, propValue){
    return propValue in values[propName];
  }

  function __gwt_getMetaProperty(name_0){
    var value = metaProps[name_0];
    return value == null?null:value;
  }

  function unflattenKeylistIntoAnswers(propValArray, value){
    var answer = answers;
    for (var i = 0, n = propValArray.length - 1; i < n; ++i) {
      answer = answer[propValArray[i]] || (answer[propValArray[i]] = []);
    }
    answer[propValArray[n]] = value;
  }

  function computePropValue(propName){
    var value = providers[propName](), allowedValuesMap = values[propName];
    if (value in allowedValuesMap) {
      return value;
    }
    var allowedValuesList = [];
    for (var k in allowedValuesMap) {
      allowedValuesList[allowedValuesMap[k]] = k;
    }
    if (propertyErrorFunc) {
      propertyErrorFunc(propName, allowedValuesList, value);
    }
    throw null;
  }

  var frameInjected;
  function maybeInjectFrame(){
    if (!frameInjected) {
      frameInjected = true;
      var iframe = $doc_0.createElement('iframe');
      iframe.src = "javascript:''";
      iframe.id = 'org.opentaps.gwt.crmsfa.crmsfa';
      iframe.style.cssText = 'position:absolute;width:0;height:0;border:none';
      iframe.tabIndex = -1;
      $doc_0.body.appendChild(iframe);
      $stats && $stats({moduleName:'org.opentaps.gwt.crmsfa.crmsfa', sessionId:$sessionId_0, subSystem:'startup', evtGroup:'moduleStartup', millis:(new Date).getTime(), type:'moduleRequested'});
      iframe.contentWindow.location.replace(base + initialHtml);
    }
  }

  providers['locale'] = function(){
    try {
      var locale;
      var defaultLocale = 'default' || 'default';
      if (locale == null) {
        var args = location.search;
        var startLang = args.indexOf('locale=');
        if (startLang >= 0) {
          var language = args.substring(startLang);
          var begin = language.indexOf('=') + 1;
          var end = language.indexOf('&');
          if (end == -1) {
            end = language.length;
          }
          locale = language.substring(begin, end);
        }
      }
      if (locale == null) {
        locale = __gwt_getMetaProperty('locale');
      }
      if (locale == null) {
        locale = $wnd_0['__gwt_Locale'];
      }
       else {
        $wnd_0['__gwt_Locale'] = locale || defaultLocale;
      }
      if (locale == null) {
        return defaultLocale;
      }
      while (!__gwt_isKnownPropertyValue('locale', locale)) {
        var lastIndex = locale.lastIndexOf('_');
        if (lastIndex == -1) {
          locale = defaultLocale;
          break;
        }
         else {
          locale = locale.substring(0, lastIndex);
        }
      }
      return locale;
    }
     catch (e) {
      alert('Unexpected exception in locale detection, using default: ' + e);
      return 'default';
    }
  }
  ;
  values['locale'] = {bg:0, 'default':1, en:2, es:3, fr:4, it:5, nl:6, pt:7, ru:8, zh:9};
  providers['user.agent'] = function(){
    var ua = navigator.userAgent.toLowerCase();
    var makeVersion = function(result){
      return parseInt(result[1]) * 1000 + parseInt(result[2]);
    }
    ;
    if (ua.indexOf('opera') != -1) {
      return 'opera';
    }
     else if (ua.indexOf('webkit') != -1) {
      return 'safari';
    }
     else if (ua.indexOf('msie') != -1) {
      if (document.documentMode >= 8) {
        return 'ie8';
      }
       else {
        var result_0 = /msie ([0-9]+)\.([0-9]+)/.exec(ua);
        if (result_0 && result_0.length == 3) {
          var v = makeVersion(result_0);
          if (v >= 6000) {
            return 'ie6';
          }
        }
      }
    }
     else if (ua.indexOf('gecko') != -1) {
      var result_0 = /rv:([0-9]+)\.([0-9]+)/.exec(ua);
      if (result_0 && result_0.length == 3) {
        if (makeVersion(result_0) >= 1008)
          return 'gecko1_8';
      }
      return 'gecko';
    }
    return 'unknown';
  }
  ;
  values['user.agent'] = {gecko:0, gecko1_8:1, ie6:2, ie8:3, opera:4, safari:5};
  org_opentaps_gwt_crmsfa_crmsfa.onScriptLoad = function(){
    if (frameInjected) {
      loadDone = true;
      maybeStartModule();
    }
  }
  ;
  org_opentaps_gwt_crmsfa_crmsfa.onInjectionDone = function(){
    scriptsDone = true;
    $stats && $stats({moduleName:'org.opentaps.gwt.crmsfa.crmsfa', sessionId:$sessionId_0, subSystem:'startup', evtGroup:'loadExternalRefs', millis:(new Date).getTime(), type:'end'});
    maybeStartModule();
  }
  ;
  processMetas();
  computeScriptBase();
  var strongName;
  var initialHtml;
  if (isHostedMode()) {
    if ($wnd_0.external && ($wnd_0.external.initModule && $wnd_0.external.initModule('org.opentaps.gwt.crmsfa.crmsfa'))) {
      $wnd_0.location.reload();
      return;
    }
    initialHtml = 'hosted.html?org_opentaps_gwt_crmsfa_crmsfa';
    strongName = '';
  }
  $stats && $stats({moduleName:'org.opentaps.gwt.crmsfa.crmsfa', sessionId:$sessionId_0, subSystem:'startup', evtGroup:'bootstrap', millis:(new Date).getTime(), type:'selectingPermutation'});
  if (!isHostedMode()) {
    try {
      unflattenKeylistIntoAnswers(['es', 'gecko1_8'], '02D4805611473BA177A12B8CE59E9A10');
      unflattenKeylistIntoAnswers(['pt', 'gecko'], '04441A56AA14612D73094CBE2B0B5F9E');
      unflattenKeylistIntoAnswers(['zh', 'safari'], '049A7B877879F524FBCCDE246829145E');
      unflattenKeylistIntoAnswers(['bg', 'gecko1_8'], '053C670C2BB7F3C76C5958C4E6ED169D');
      unflattenKeylistIntoAnswers(['fr', 'ie6'], '0844A9B4C2545A2CD5AFEF67F4965418');
      unflattenKeylistIntoAnswers(['ru', 'opera'], '097B83131C3521DB9CDABE47E833FAA0');
      unflattenKeylistIntoAnswers(['pt', 'ie6'], '0D4D543CED9645116AFE55B6CB56A60A');
      unflattenKeylistIntoAnswers(['it', 'gecko'], '17C05B41901F18B8023FDF45F5C03D2B');
      unflattenKeylistIntoAnswers(['ru', 'safari'], '20958A9E0F0D2B02BDFE9C5364D2287E');
      unflattenKeylistIntoAnswers(['en', 'gecko'], '27A4B4E86B37950CF8B7D62DD781CC0B');
      unflattenKeylistIntoAnswers(['en', 'safari'], '2E1C6BD48BB545998B43CF3D9154D12F');
      unflattenKeylistIntoAnswers(['nl', 'opera'], '338EAD8F66803231632CE6E372546CD9');
      unflattenKeylistIntoAnswers(['zh', 'gecko'], '387ACCB242F3612A2F7B693B7104294D');
      unflattenKeylistIntoAnswers(['en', 'opera'], '452304C99D665B18D98D9684547BCBBA');
      unflattenKeylistIntoAnswers(['fr', 'safari'], '4BA99232FCF8121A78504E33D58DB2DA');
      unflattenKeylistIntoAnswers(['en', 'ie6'], '4F9183B1382F7E37E9BC987DAAD164C9');
      unflattenKeylistIntoAnswers(['default', 'ie6'], '505F06A79E57FA4C38EB52CA6C885A11');
      unflattenKeylistIntoAnswers(['nl', 'safari'], '50A6095642FAEE08E6866C7D11327C3A');
      unflattenKeylistIntoAnswers(['fr', 'gecko'], '657A281543848B21C67E5D142E2DFB3B');
      unflattenKeylistIntoAnswers(['zh', 'gecko1_8'], '66BCAB4B14ED859C036717038F18B375');
      unflattenKeylistIntoAnswers(['default', 'gecko1_8'], '6A89C979A9A7E837711ED0B0A1FF70AD');
      unflattenKeylistIntoAnswers(['it', 'gecko1_8'], '6C6B45DE3159711321FF563F3081D311');
      unflattenKeylistIntoAnswers(['pt', 'opera'], '6EDF5C912BD9A00AD48E03CCA5B92550');
      unflattenKeylistIntoAnswers(['es', 'opera'], '71D0521F2A01F729D033B65328D3C878');
      unflattenKeylistIntoAnswers(['zh', 'opera'], '7306DD9E3CA1E93AF801380163AE271A');
      unflattenKeylistIntoAnswers(['zh', 'ie6'], '75264B2CC69E20C3541851A8B724C809');
      unflattenKeylistIntoAnswers(['fr', 'opera'], '7DB18932ECA44CE56FC3E64EE2B6784F');
      unflattenKeylistIntoAnswers(['bg', 'opera'], '818D5BAE28FCE1D8968E37B7E604202F');
      unflattenKeylistIntoAnswers(['bg', 'ie6'], '9A706E7C649E803AEF582F04C2A3BF3B');
      unflattenKeylistIntoAnswers(['pt', 'safari'], 'A1FBC8AF43C8B8590309454F03C7BC9B');
      unflattenKeylistIntoAnswers(['fr', 'gecko1_8'], 'B052E054E2DADC82A11A5A46C138C28A');
      unflattenKeylistIntoAnswers(['ru', 'gecko'], 'B33F049F761B92CA305DA11C5D2D8865');
      unflattenKeylistIntoAnswers(['bg', 'safari'], 'B456D86C2EB84A253759DBA0AA286C32');
      unflattenKeylistIntoAnswers(['it', 'safari'], 'BC097A9422665DDC7FAB46205435A983');
      unflattenKeylistIntoAnswers(['ru', 'gecko1_8'], 'BF4224DB1FE8C5B863867945807BEC90');
      unflattenKeylistIntoAnswers(['bg', 'gecko'], 'C6A300ABC06AAE26AD260AAAB0C4A80D');
      unflattenKeylistIntoAnswers(['es', 'safari'], 'CA367C8627EF92D857EE94A2F56AFA25');
      unflattenKeylistIntoAnswers(['default', 'gecko'], 'CEA1266BE0F7D8A648B8520645C97EC0');
      unflattenKeylistIntoAnswers(['pt', 'gecko1_8'], 'D59E1E096A775BBF83C69EE55070A457');
      unflattenKeylistIntoAnswers(['nl', 'ie6'], 'DCF930AD26DA16E214866BE4B87986F8');
      unflattenKeylistIntoAnswers(['it', 'opera'], 'DD34145C560AA7B7FDF7C6594B0BA114');
      unflattenKeylistIntoAnswers(['nl', 'gecko1_8'], 'E3DAB5BF2D8CCE781B0546A277881465');
      unflattenKeylistIntoAnswers(['it', 'ie6'], 'EBB3C415305EF688782CA6A67B67FD0C');
      unflattenKeylistIntoAnswers(['default', 'opera'], 'ED3BBCBC7C16854F68BF9FEC365D6708');
      unflattenKeylistIntoAnswers(['en', 'gecko1_8'], 'EEB6EE1FF4F6F45F655D13DE1AAACAA0');
      unflattenKeylistIntoAnswers(['es', 'gecko'], 'EEBF95D1B85FB53CD832FEFEF9BFAE29');
      unflattenKeylistIntoAnswers(['nl', 'gecko'], 'F61FB09DEA2CD56C592425DBD73146A2');
      unflattenKeylistIntoAnswers(['default', 'safari'], 'F62952DF08F0F15CF98BB7BC9D8D1609');
      unflattenKeylistIntoAnswers(['es', 'ie6'], 'F645E64476027FD0D4D7C76F84E3E66F');
      unflattenKeylistIntoAnswers(['ru', 'ie6'], 'FAD887AF55172C188E17DC6CBE4F72EF');
      strongName = answers[computePropValue('locale')][computePropValue('user.agent')];
      var idx = strongName.indexOf(':');
      if (idx != -1) {
        softPermutationId = Number(strongName.substring(idx + 1));
        strongName = strongName.substring(0, idx);
      }
      initialHtml = strongName + '.cache.html';
    }
     catch (e) {
      return;
    }
  }
  var onBodyDoneTimerId;
  function onBodyDone(){
    if (!bodyDone) {
      bodyDone = true;
      if (!__gwt_stylesLoaded['standard.css']) {
        var l = $doc_0.createElement('link');
        __gwt_stylesLoaded['standard.css'] = l;
        l.setAttribute('rel', 'stylesheet');
        l.setAttribute('href', base + 'standard.css');
        $doc_0.getElementsByTagName('head')[0].appendChild(l);
      }
      if (!__gwt_stylesLoaded['GwtExt.css']) {
        var l = $doc_0.createElement('link');
        __gwt_stylesLoaded['GwtExt.css'] = l;
        l.setAttribute('rel', 'stylesheet');
        l.setAttribute('href', base + 'GwtExt.css');
        $doc_0.getElementsByTagName('head')[0].appendChild(l);
      }
      maybeStartModule();
      if ($doc_0.removeEventListener) {
        $doc_0.removeEventListener('DOMContentLoaded', onBodyDone, false);
      }
      if (onBodyDoneTimerId) {
        clearInterval(onBodyDoneTimerId);
      }
    }
  }

  if ($doc_0.addEventListener) {
    $doc_0.addEventListener('DOMContentLoaded', function(){
      maybeInjectFrame();
      onBodyDone();
    }
    , false);
  }
  var onBodyDoneTimerId = setInterval(function(){
    if (/loaded|complete/.test($doc_0.readyState)) {
      maybeInjectFrame();
      onBodyDone();
    }
  }
  , 50);
  $stats && $stats({moduleName:'org.opentaps.gwt.crmsfa.crmsfa', sessionId:$sessionId_0, subSystem:'startup', evtGroup:'bootstrap', millis:(new Date).getTime(), type:'end'});
  $stats && $stats({moduleName:'org.opentaps.gwt.crmsfa.crmsfa', sessionId:$sessionId_0, subSystem:'startup', evtGroup:'loadExternalRefs', millis:(new Date).getTime(), type:'begin'});
  if (!__gwt_scriptsLoaded['adapter/ext/ext-base.js']) {
    __gwt_scriptsLoaded['adapter/ext/ext-base.js'] = true;
    document.write('<script language="javascript" src="' + base + 'adapter/ext/ext-base.js"><\/script>');
  }
  if (!__gwt_scriptsLoaded['ext-all.js']) {
    __gwt_scriptsLoaded['ext-all.js'] = true;
    document.write('<script language="javascript" src="' + base + 'ext-all.js"><\/script>');
  }
  $doc_0.write('<script defer="defer">org_opentaps_gwt_crmsfa_crmsfa.onInjectionDone(\'org.opentaps.gwt.crmsfa.crmsfa\')<\/script>');
}

org_opentaps_gwt_crmsfa_crmsfa();
