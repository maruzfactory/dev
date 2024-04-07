

function doGet(e) {
  // URLのexec/(またはdev/)以降を取得
  const page = e.pathInfo ? e.pathInfo : "index"
  
  // 該当するテンプレートを取得する
  const template = (() => {
    try {
      return HtmlService.createTemplateFromFile(page);
    } catch(e) {
      return HtmlService.createTemplateFromFile("error");
    }
  })();

  // htmlを返す
  template.url = ScriptApp.getService().getUrl();   // テンプレートにアプリのURLを渡す
  return template.evaluate()                        // テンプレートを評価してhtmlを返す
    .addMetaTag('viewport', 'width=device-width,initial-scale=1');  // viewportを設定
}
