// 参照　https://sinap.jp/blog/2018/09/gasbot.html
  var currentTime = new Date();
  var newFeeds = [];

function check() {
  var sheets = SpreadsheetApp.getActiveSpreadsheet().getSheets();
    for (var i in sheets) { // 全シートを順番にチェック
      addNewFeeds(sheets[i]);
      }
    postToLine();
}

// 新着があれば配列に追加
function addNewFeeds(sheet) {
  var feeds = getFeeds(sheet);
    for (var i in feeds['feeds']) {
      if (isNewFeed(feeds['feeds'][i][3], feeds['lastCheckTime'])) { // > 前回起動時間以降の投稿か判定
      feeds['feeds'][i][3] = sheet.getName();
      newFeeds.push(feeds['feeds'][i]);
      }
    }
}
    
// 最新のフィードを取得
function getFeeds(sheet) {
  var values = sheet.getRange(1, 1, 1, 3).getValues();
  var lastCheckTime = values[0][2]; // 前回のタスク実行時刻を取得
    sheet.getRange('C1').setValue(currentTime);//取得日次を更新
  var lastRow = sheet.getLastRow();
  var feeds = sheet.getRange(2, 1, lastRow - 1, 4).getValues(); // D列まで取得
    return {'feeds': feeds, 'lastCheckTime': lastCheckTime};
}

// 前回のチェック以降の投稿か確認
function isNewFeed(date, lastCheckTime) {
  var postTime = new Date(date);
  return (postTime.getTime() > lastCheckTime.getTime());
}

// Lineに投稿
function postToLine() {
  for (var i in newFeeds) {
    var subject = newFeeds[i][3]
    var body = newFeeds[i][0] + "\r\n" + newFeeds[i][1]+ "\r\n" + newFeeds[i][2];
      requestToChatwork(subject, body);
  }
}

///
function myFunction(subject, body) {
  const url = "https://notify-api.line.me/api/notify";
  const token = ["***"]; //tokenを入力

  var body  = subject + "\n" + body ;

  var sendLine = {
    "method":"post",
    "headers":{
      "Authorization":"Bearer " + token,
      },
    "payload":{
      'message': body
      },
  } 
  
  UrlFetchApp.fetch(url,sendLine);
}