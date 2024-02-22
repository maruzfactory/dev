# Ghostscript�̃p�X��ݒ�
$ghostscriptPath = "C:\Users\Maruyama Hiroshi\Desktop\pdftiff\gs10.02.1\bin\gswin64c.exe"

# �o�͂���PDF�t�@�C���̃p�X���w��
$outputPDFPath = "C:\Users\Maruyama Hiroshi\Desktop\pdftiff\tiff\output.pdf"

# �o�͂���TIFF�t�@�C���̃p�X���w��
$outputTIFFPath = "C:\Users\Maruyama Hiroshi\Desktop\pdftiff\tiff\output.tiff"

# A�t�H���_���̑S�Ă�PDF�t�@�C�����擾
$pdfFiles = Get-ChildItem -Path "C:\Users\Maruyama Hiroshi\Desktop\pdftiff\pdf" -Filter *.pdf

# Ghostscript���g����PDF�t�@�C��������
$pdfArgs = @("-q", "-dNOPAUSE", "-sDEVICE=pdfwrite", "-sOutputFile=$outputPDFPath", "-dBATCH")
$pdfArgs += $pdfFiles.FullName
& $ghostscriptPath @pdfArgs

# Ghostscript���g����PDF��TIFF�ɕϊ�
$tiffArgs = @("-q", "-dNOPAUSE", "-sDEVICE=tiffg4", "-r300", "-sOutputFile=$outputTIFFPath", "-dBATCH", $outputPDFPath)
& $ghostscriptPath @tiffArgs

Remove-item "C:\Users\Maruyama Hiroshi\Desktop\pdftiff\tiff\output.pdf"
Write-Host "Conversion completed."
