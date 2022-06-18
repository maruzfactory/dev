#データを抽出（"信濃"を含む駅名のみ抽出）後、CSV出力
$csv | Where-Object {$_.駅名 -match '.*信濃.*'} | Export-Csv ./result.csv -Encoding Default -NoTypeInformation

#参照　https://hebodj.net/2021/03/27/powershellによるcsvファイルからのデータ抽出/
#参照　https://miyalog.info/technology/1357/

#列抽出
import-csv test.csv  -encoding Default | select "氏名","年齢" | export-csv out.csv -encoding Default　-NoTypeInformation

#----------
#test.csvを読込1～9列目の列数を追加。
#1列目をout.csvで抽出
import-csv data.csv -Encoding Default -header @(1..9) |select "1","4" | export-csv out.csv -Encoding Default -NoTypeInformation

#out.csvを読込、1行目（列数を追加した行）を飛ばしてex-result.csvに抽出
get-content out.csv -Encoding Default | select -skip 1 | foreach {$_.Replace('"','')} | out-file ex-result.csv

#tsvをcsvに変換
import-csv ex-result.csv -Encoding Default | export-csv result.csv -Encoding Default -NoTypeInformation

