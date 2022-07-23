#�@�Q�l
#�@https://feeld-uni.com/entry/2020/09/10/165637
#�@https://lig-log.com/using-powershell-to-extract-and-sort-rows-from-csv-file-that-match-list/

#���O�t�@�C���o�͐�
$LogFile = �gC:\pg.log�h

Start-Transcript $LogFile

#�f�[�^��
$DataFile = �gC:\data.csv�h
#��r���X�g
$SearchFile = �gC:\list.csv�h
#�o�̓t�@�C��
$Export = �gC:\export.csv�h

#�t�@�C���ǂݍ���
$SearchList = Get-Content $SearchFile -Encoding Default
$DataList = Import-Csv $DataFile

#�������X�g����ɑΏۍs�𒊏o
$Check = $DataList | Where-Object -FilterScript { $SearchList -contains $_.���ږ� }


#���o�����s�̃\�[�g
#�@$Sort = $Extraction | Sort-Object -Property �g���ږ��h

#���o���X�g�̃G�N�X�|�[�g
#�@$Sort | Export-Csv $Export -Encoding Default -NoTypeInformation

Stop-Transcript