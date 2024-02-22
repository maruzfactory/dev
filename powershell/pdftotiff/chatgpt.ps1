# Ghostscript�̃p�X��ݒ�
$ghostscriptPath = "gs10.02.1\bin\gswin64c.exe"

# �o�͂���PDF�t�@�C���̃p�X���w��
$outputPDFPath = "output.pdf"

# �o�͂���TIFF�t�@�C���̃p�X���w��
$outputTIFFPath = "output.tiff"

# A�t�H���_���̑S�Ă�PDF�t�@�C�����擾
$pdfFiles = Get-ChildItem -Path "\pdftiff\pdf" -Filter *.pdf

# Ghostscript���g����PDF�t�@�C��������
$pdfArgs = @("-q", "-dNOPAUSE", "-sDEVICE=pdfwrite", "-sOutputFile=$outputPDFPath", "-dBATCH")
$pdfArgs += $pdfFiles.FullName
& $ghostscriptPath @pdfArgs

# Ghostscript���g����PDF��TIFF�ɕϊ�
$tiffArgs = @("-q", "-dNOPAUSE", "-sDEVICE=tiffg4", "-r300", "-sOutputFile=$outputTIFFPath", "-dBATCH", $outputPDFPath)
& $ghostscriptPath @tiffArgs

Remove-item "output.pdf"
Write-Host "Conversion completed."
