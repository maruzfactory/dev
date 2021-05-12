function myFunction() {
  var file = DriveApp.getFileById('ファイルID');
  var lastUpdate =file.getLastUpdated();
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = ss.getSheetByName("シート名");
  sheet.getRange("セル").setValue(lastUpdate);
}