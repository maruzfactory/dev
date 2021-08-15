#データを抽出（"信濃"を含む駅名のみ抽出）後、CSV出力
$csv | Where-Object {$_.駅名 -match '.*信濃.*'} | Export-Csv ./result.csv -Encoding Default -NoTypeInformation

#参照　https://hebodj.net/2021/03/27/powershellによるcsvファイルからのデータ抽出/
#参照　https://miyalog.info/technology/1357/
