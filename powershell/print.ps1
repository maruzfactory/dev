#参考
##　https://acoustic-groove2.hatenablog.com/entry/2017/11/23/175115
##　https://qiita.com/tukiyo3/items/95dc37174134a59d3e24
##　https://letspowershell.blogspot.com/2015/06/powershell.html

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
[System.Windows.Forms.MessageBox]::Show($Folder,"処理完了")



#-----------------------------------
# 処理名：自動印刷
#-----------------------------------
#対象フォルダ

#予告メッセージ
Write-Host "$Folder フォルダ直下のファイルをすべて印刷する！"
Write-Host "※ファイル間のスリープ処理：2秒`r`n"

#ファイル名の昇順で印刷実行
Dir $folder | Sort Name | ForEach{

    #ファイル名表示後、実行
    Write-Host $_.Name
    Start-Process $_.FullName -Verb Print -WindowStyle Hidden | Stop-Process

    #2秒スリープ
    Start-Sleep -s 2
}

Write-Host "`r`n完了！`r`n"
Read-Host "×ボタンで終了"