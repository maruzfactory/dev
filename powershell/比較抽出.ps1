#　参考
#　https://feeld-uni.com/entry/2020/09/10/165637
#　https://lig-log.com/using-powershell-to-extract-and-sort-rows-from-csv-file-that-match-list/

#ログファイル出力先
$LogFile = “C:\pg.log”

Start-Transcript $LogFile

#データ元
$DataFile = “C:\data.csv”
#比較リスト
$SearchFile = “C:\list.csv”
#出力ファイル
$Export = “C:\export.csv”

#ファイル読み込み
$SearchList = Get-Content $SearchFile -Encoding Default
$DataList = Import-Csv $DataFile

#検索リストを基に対象行を抽出
$Check = $DataList | Where-Object -FilterScript { $SearchList -contains $_.項目名 }


#抽出した行のソート
#　$Sort = $Extraction | Sort-Object -Property “項目名”

#抽出リストのエクスポート
#　$Sort | Export-Csv $Export -Encoding Default -NoTypeInformation

Stop-Transcript
