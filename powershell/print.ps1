#参考
##　https://acoustic-groove2.hatenablog.com/entry/2017/11/23/175115
##　https://qiita.com/tukiyo3/items/95dc37174134a59d3e24

#-----------------------------------
# 処理名：自動印刷
#-----------------------------------
#対象フォルダ
$folder = "C:\Users\Maruyama Hiroshi\Desktop\tes\print"

#予告メッセージ
Write-Host "$folder フォルダ直下のファイルをすべて印刷する！"
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