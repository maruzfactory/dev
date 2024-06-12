// doGet関数はWEBアプリのエントリーポイントです
function doGet() {
  // HTMLサービスを使ってHTMLファイルを取得
  return HtmlService.createHtmlOutputFromFile('index');
}

// 編集用のHTMLファイル
function include(filename) {
  return HtmlService.createHtmlOutputFromFile(filename)
      .getContent();
}

// 「data」シートの情報を取得する関数
function getData() {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName('data');
  var data = sheet.getDataRange().getValues();
  return data;
}

// 依頼部署によってフィルタリングされた情報を取得する関数
function getDataByDepartment(department) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName('data');
  var data = sheet.getDataRange().getValues();
  var filteredData = data.filter(function(row) {
    return row[3] === department;
  });
  return filteredData;
}

// 編集フォームの情報を更新する関数
function updateData(row, updatedData) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName('data');
  sheet.getRange(row + 1, 5).setValue(updatedData[0]); // 作業部署
  sheet.getRange(row + 1, 6).setValue(updatedData[1]); // 作業者
  sheet.getRange(row + 1, 7).setValue(updatedData[2]); // 作業完了日
  sheet.getRange(row + 1, 8).setValue(updatedData[3]); // 最終更新者
}

// マスターシートから部署名を取得する関数
function getDepartments() {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName('マスタ');
  var data = sheet.getRange('B:B').getValues().filter(String);
  return data;
}

// マスターシートから社員名を取得する関数
function getEmployeesByDepartment(department) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName('マスタ');
  var data = sheet.getDataRange().getValues();
  var filteredData = data.filter(function(row) {
    return row[1] === department;
  }).map(function(row) {
    return row[2]; // 社員名を返す
  });
  return filteredData;
}

// マスターシートからメールアドレスを取得する関数
function getEmailByEmployeeName(employeeName) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName('マスタ');
  var data = sheet.getDataRange().getValues();
  for (var i = 0; i < data.length; i++) {
    if (data[i][2] === employeeName) {
      return data[i][3]; // メールアドレスを返す
    }
  }
  return "メールアドレスが見つかりませんでした";
}
