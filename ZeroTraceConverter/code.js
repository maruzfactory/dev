// ■ 設定：ログとアクセス解析を保存するスプレッドシートID
// ※ログ機能を使う場合は、ここにIDを入力し、一度エディタ上で関数を実行して権限を承認してください。
// 空欄のままでもアプリは動作します（ログはGASのコンソールにのみ出力されます）。
const LOG_SHEET_ID = ''; 

function doGet(e) {
  recordLog('ACCESS', 'アプリが表示されました');
  return HtmlService.createTemplateFromFile('index')
    .evaluate()
    .setTitle('LocalDoc Studio')
    .addMetaTag('viewport', 'width=device-width, initial-scale=1');
}

/**
 * ログ記録
 */
function recordLog(type, details) {
  const timestamp = new Date();
  const userEmail = Session.getActiveUser().getEmail() || 'Anonymous';
  
  // コンソールには常に出力
  console.log(`[${type}] ${userEmail}: ${details}`);
  
  // IDが設定されていない場合はここで終了（エラー回避）
  if (!LOG_SHEET_ID || LOG_SHEET_ID.trim() === '') {
    return;
  }

  try {
    const ss = SpreadsheetApp.openById(LOG_SHEET_ID);
    let sheet = ss.getSheetByName('AccessLog');
    if (!sheet) {
      sheet = ss.insertSheet('AccessLog');
      sheet.appendRow(['日時', 'ユーザー', '種類', '詳細']);
    }
    sheet.appendRow([timestamp, userEmail, type, details]);
  } catch (e) {
    // 権限エラーなどが起きてもアプリを止めないようにコンソールに出力して無視
    console.warn('スプレッドシートへのログ保存に失敗しました: ' + e.toString());
  }
}