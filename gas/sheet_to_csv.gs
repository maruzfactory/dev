function outputSheetToCsvFile() {
  // 定数
  var fileName = "filename.csv";
  var contentType = "text/csv";
  var charSet = "Shift_JIS";
  var lineDelimiter = ",";
  var newLineChar = "\r\n";
  var _ = Underscore.load();

  // Underscore　ID：1PcEHcGVC1njZd8SfXtmgQk19djwVd2GrrW1gd7U5hNk033tzi6IUvIAV をライブラリに追加する

  // 開いているシートからデータを取得
  var range = SpreadsheetApp.getActiveSheet().getDataRange();
  var values = range.getValues();

  // 2次元配列になっているデータをcsvのstringに変換
  var csvString =  _.map(
    values,
    function(row){return row.join(lineDelimiter);}
  ).join(newLineChar);

  // Shift_JISなBlobに変換
  var blob = Utilities.newBlob("", contentType, fileName).setDataFromString(csvString, charSet);

  //CSVファイルの保存先フォルダを指定
  var id = '**********'; //フォルダID
  var folder = DriveApp.getFolderById(id);

  //CSVファイルを作成
  folder.createFile(blob);

}

function onOpen() {
  // メニューバーにカスタムメニューを追加
  var spreadsheet = SpreadsheetApp.getActiveSpreadsheet();
  var entries = [{
    name : "ダウンロード",
    functionName : "outputSheetToCsvFile"
  }];
  spreadsheet.addMenu("CSV出力", entries);
};