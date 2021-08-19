@echo off
setlocal

rem ==========================
rem 資格情報作成
rem ==========================
echo 資格情報を作成します
cmdkey /add:%server1% /user:%username% /pass:%password%
echo サーバー : server1の資格情報を登録しました
cmdkey /add:%server2% /user:%username% /pass:%password%
echo サーバー : server2の資格情報を登録しました
cmdkey /add:%server3% /user:%username% /pass:%password%
echo サーバー : server3の資格情報を登録しました

rem ==========================
rem ドライブ割り当て
rem ==========================
echo;
echo ネットワークドライブを割り当てます
net use X: %directory% /savecred
echo Xドライブへの割り当てが完了しました
net use Y: %directory% /savecred
echo Yドライブへの割り当てが完了しました
net use Z: %directory% /savecred
echo Zドライブへの割り当てが完了しました

echo 処理が全て完了しました
pause
endlocal

rem 参照：https://ribbit.work/blog/shell-assign-network-drive/