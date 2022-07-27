# フォルダ選択ダイアログ
# COMオブジェクトの読み込み
$shell = New-Object -com Shell.Application

# ダイアログを表示し、結果を変数folderPathに格納する
$folderPath = $shell.BrowseForFolder(0,"対象フォルダーを選択してください",0,"")

# キャンセルを選択した場合は終了
if ( $folderPath -eq $null){exit}

#  $folderPath内の情報のうち、パス情報のみを変数PATHに格納する
$Folder = $folderPath.Self.Path

# 格納したパスをメッセージボックスで表示
Add-Type -Assembly System.Windows.Forms
[System.Windows.Forms.MessageBox]::Show("印刷するファイルのあるフォルダを選択しました。","処理完了")

#　ファイル一覧を取得しテキストに書き出す
$FileList = Get-ChildItem -Recurse $Folder -File | ?{ $_.Length -ne $null } | Select-Object -ExpandProperty FullName | Out-File PrintList.txt


Write-host "ファイルの印刷を始めます！"
# ファイル一覧のファイルを1ファイルずつ印刷する
$PrintList = "PrintList.txt"
$file = (Get-Content -Encoding default $PrintList) -as [string[]]
foreach ($line in $file) {
    Write-Host $line
    Start-Process $line -Verb Print -WindowStyle Hidden | Stop-Process
    Start-Sleep -s 5
}

Write-Host "`r`n印刷完了！`r`n"

# 書き出した印刷一覧ファイルのテキストファイルを削除
Remove-item　PrintList.txt

Read-host "印刷が終了しました。`r`n AdobeReaderを閉じてください。`r`n この画面御閉じてください！"