
# gswin64c -sDEVICE=tiffg4 -r300x300 -o $outputTifff $pdfFiles

## pdf to tiff
$PDFs = Get-ChildItem "PDF�ۑ��t�H���_" *.pdf
$OutputDir = "tiff�o�̓t�H���_"

foreach ($PDF in $PDFs) {
    & "gswin64c" -q -dNOPAUSE -sDEVICE=tiffg4 -r300 -o "$OutputDir\$($PDF.BaseName).tiff" $PDF.FullName -c quit
}
