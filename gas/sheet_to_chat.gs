function myFunction() {
    // // スプレッドシートを取得
    var sheet = SpreadsheetApp.getActive();
    var sheetName = sheet.getSheetByName("シート名");

    var url = 'Webhook'; // WebhookのURLを入力

    var row = 1; // 開始行
    var column = 1; // 開始列
    var lastRow = sheetName.getDataRange().getLastRow(); // 最終行
    var lastCol = sheetName.getDataRange().getLastColumn(); // 最終列
    var numRows = lastRow - row + 1; // データ範囲の行数
    var numColumns = lastCol -column + 1; // データ範囲の列数
    var cellData = sheetName.getRange(row, column,numRows, numColumns).getValues();
    for(i=0; i < cellData.length; i++)

    var text = '時間：送信したい文字列'+'\n'+cellData[i]+'\n'+ 'よろしくおねがいします◎';

    // 送信内容を生成
    var message = {'text' : text}
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