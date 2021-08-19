// Googleフォーム→スプレッドシート→Chat通知
function myFunction() {
  // // スプレッドシートを取得
  var sheet = SpreadsheetApp.getActive();
  var sheetName = sheet.getSheetByName("***"); // シート名を入力

  var row = 1; // 開始行
  var column = 1; // 開始列
  var lastRow = sheetName.getDataRange().getLastRow(); // 最終行
  var lastCol = sheetName.getDataRange().getLastColumn(); // 最終列
  var numRows = lastRow - row +1; // データ範囲の行数
  var numColumns = lastCol -column + 1; // データ範囲の列数
  var data = sheetName.getRange(row, column,numRows, numColumns).getValues();

  // 情報
  const firstCol= 0; // 1列目
  const secondCol = 1; // 2列目
  const thirdCol = 2;  // 3列目
  const fourthCol = 3;  // 3列目

  for(i=0; i < data.length; i++){
    const writedate = data[i][firstCol];
    var information = 'ここからchatに通知' + '\n'
                  + '日時： ' + Utilities.formatDate(new Date(writedate),"Asia/Tokyo","yyyy年M月d日 H時m分s秒")+ '\n'
                  + 'No：' + numRows + '\n'
                  + '2列目： ' + data[i][secondCol] + '\n'
                  + '3列目： ' + data[i][thirdCol] + '\n'
                  + '4列目： ' + data[i][fourthCol] + '\n'
                  + '\n'
                  + "<https://www.google.com/|Google>" + '\n' // アンカーリンクの記載方法
                  + "<https://developers.google.com/chat|Google Chat API>" + '\n'
                  }

  // Webhookを設定
  var url = 'URLを入力';

  // 送信内容を生成
  var message = {'text' : information}
  var options = {
    'method': 'POST',
    'headers' : {
      'Content-Type': 'application/json; charset=UTF-8'
    },
    'payload':JSON.stringify(message)
  };

  // 送信を実行
  var result = UrlFetchApp.fetch(url, options);
}
