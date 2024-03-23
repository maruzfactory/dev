#フォルダツリーを表示
rem フォルダツリーを表示
tree

rem フォルダ一覧を表示 
dir

rem ディレクトリに含まれるファイルを含めてa.txtに保存する
tree /f >a.txt

rem ファイル削除
del ***.txt

rem バッチファイルでPowershellを呼び出す。
powershell -NoProfile -ExecutionPolicy Unrestricted .\***.ps1
