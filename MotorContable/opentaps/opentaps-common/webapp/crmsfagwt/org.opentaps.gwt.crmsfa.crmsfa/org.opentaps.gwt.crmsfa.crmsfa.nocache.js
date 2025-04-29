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
      unflattenKeylistIntoAnswers(['it', 'gecko'], '0C268930093FDCFB4F19B9B3D8069A73');
      unflattenKeylistIntoAnswers(['it', 'opera'], '144E12AA0E1EC2B57E078967387E8C74');
      unflattenKeylistIntoAnswers(['fr', 'gecko1_8'], '2530D76922CA1905B19F48C4FA07F4F5');
      unflattenKeylistIntoAnswers(['pt', 'ie6'], '2D7492A20258BAF922ED9403D5EBA904');
      unflattenKeylistIntoAnswers(['en', 'ie6'], '336A555F46903029731B83A0AB028B5E');
      unflattenKeylistIntoAnswers(['zh', 'gecko1_8'], '3C1021A32006253D25F6AF86F87DF819');
      unflattenKeylistIntoAnswers(['en', 'gecko1_8'], '3D2F5E0CE746C63237D76950CDDBC36D');
      unflattenKeylistIntoAnswers(['fr', 'gecko'], '3F23745173C4C0407CCDEF61EDE547BC');
      unflattenKeylistIntoAnswers(['bg', 'ie6'], '40996BDA7FCDE89DDCCB164232FCCC8A');
      unflattenKeylistIntoAnswers(['es', 'ie6'], '448DADE6062C6EB810170E296F317A54');
      unflattenKeylistIntoAnswers(['ru', 'gecko1_8'], '454B03A330010DBEC68FEBBC7FE97EBB');
      unflattenKeylistIntoAnswers(['pt', 'gecko1_8'], '4AEF32884140CE859AE1AE17CDB07041');
      unflattenKeylistIntoAnswers(['nl', 'gecko'], '5268091A35941D9A5FEAEB85A340B5D3');
      unflattenKeylistIntoAnswers(['default', 'ie6'], '6A8EA5AAF25210B51F7CDB2CB0D869CA');
      unflattenKeylistIntoAnswers(['en', 'opera'], '6B420BBADC986BC9AB9B7AF8282B0F05');
      unflattenKeylistIntoAnswers(['default', 'gecko'], '6CD719B73804FD95B550A824E264C6C1');
      unflattenKeylistIntoAnswers(['pt', 'gecko'], '81C4E587E27966588DD5E408E61FA67E');
      unflattenKeylistIntoAnswers(['bg', 'gecko1_8'], '8548DB6051E7DF7E9E8F4E5F2D95CCE5');
      unflattenKeylistIntoAnswers(['ru', 'opera'], '86EE04E08C3EA50D6CBADBC0C8C1BAF6');
      unflattenKeylistIntoAnswers(['pt', 'safari'], '91C179B6C0B571D27596BCC8AA8EA678');
      unflattenKeylistIntoAnswers(['ru', 'safari'], '923AF950FB0B4AF9F76A07B1B90B8D37');
      unflattenKeylistIntoAnswers(['es', 'opera'], '9780223A8309276AB35F8CC6CE963711');
      unflattenKeylistIntoAnswers(['it', 'safari'], '98DB0663D029E3699E6BC0DE22217B72');
      unflattenKeylistIntoAnswers(['pt', 'opera'], '9BA66AC84588E87364E0D571D2BE1BBC');
      unflattenKeylistIntoAnswers(['ru', 'gecko'], '9F5BEFA66D2E0308D3D97E4CFFB0CFA8');
      unflattenKeylistIntoAnswers(['it', 'ie6'], '9F712AE9801A328D7C43B3337D8EC47A');
      unflattenKeylistIntoAnswers(['zh', 'opera'], 'A9453E5EF082538A0F2906CFD51B534E');
      unflattenKeylistIntoAnswers(['zh', 'ie6'], 'AE9A60DC70A06D743C1664F0835D437A');
      unflattenKeylistIntoAnswers(['en', 'safari'], 'AF2C54534C6BFDE4E3261B04C4CD9B98');
      unflattenKeylistIntoAnswers(['nl', 'safari'], 'B11367B3154684EF8C0635F8F6E3FA0B');
      unflattenKeylistIntoAnswers(['default', 'opera'], 'B29DFF9AFC95DFD55FA5A6F387EDAFCD');
      unflattenKeylistIntoAnswers(['it', 'gecko1_8'], 'BA1849FEA822BBEAAEFBFE690A12DC08');
      unflattenKeylistIntoAnswers(['default', 'safari'], 'BA713D1EFAFD5F1CA5BDCE8557980212');
      unflattenKeylistIntoAnswers(['nl', 'ie6'], 'BC081BFFCE110E844040F8716F30AB4D');
      unflattenKeylistIntoAnswers(['bg', 'opera'], 'C06E11A9C16759D49BFF8EFE18FCC765');
      unflattenKeylistIntoAnswers(['fr', 'opera'], 'CA06FADBFEACB388C7F624552BE1966E');
      unflattenKeylistIntoAnswers(['es', 'gecko'], 'CC1B9C32BC405910ED7182691BE03BF3');
      unflattenKeylistIntoAnswers(['default', 'gecko1_8'], 'D2B4ED2BA1BF9C8ED16EA96E3DDD124A');
      unflattenKeylistIntoAnswers(['zh', 'safari'], 'DBABA94B88FBD64FD0264A6E49480BBD');
      unflattenKeylistIntoAnswers(['ru', 'ie6'], 'DC0A1CA2197717675EDCFCF465A873DC');
      unflattenKeylistIntoAnswers(['fr', 'ie6'], 'DEBE5CD3217227025F4B36A533A821F4');
      unflattenKeylistIntoAnswers(['nl', 'gecko1_8'], 'E0D4562B06FE83758362AE71F3E454C2');
      unflattenKeylistIntoAnswers(['es', 'safari'], 'E262FCDEB9D2B8533EF64244DD30E4BE');
      unflattenKeylistIntoAnswers(['es', 'gecko1_8'], 'E67D376A97A072B083ABB1B83A59A6FC');
      unflattenKeylistIntoAnswers(['nl', 'opera'], 'E8A6CABC5280CF5D84B29A4DCBD10902');
      unflattenKeylistIntoAnswers(['bg', 'safari'], 'EDEA65B90104975FC693AFEE8273B176');
      unflattenKeylistIntoAnswers(['zh', 'gecko'], 'F10F2139B7925E08E9D0500ED1920886');
      unflattenKeylistIntoAnswers(['bg', 'gecko'], 'F712E4970D67DCD022DAF12485B1F32B');
      unflattenKeylistIntoAnswers(['en', 'gecko'], 'F9BD04AECF991375AFE6145054BE8284');
      unflattenKeylistIntoAnswers(['fr', 'safari'], 'FD1C89642B45968511A97068538BB339');
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
