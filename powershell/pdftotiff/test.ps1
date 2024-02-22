
# gswin64c -sDEVICE=tiffg4 -r300x300 -o $outputTifff $pdfFiles

## pdf to tiff
$PDFs = Get-ChildItem "C:\Users\Maruyama Hiroshi\Desktop\pdftiff\pdf" *.pdf
$OutputDir = "C:\Users\Maruyama Hiroshi\Desktop\pdftiff\tiff"

foreach ($PDF in $PDFs) {
    & "gswin64c" -q -dNOPAUSE -sDEVICE=tiffg4 -r300 -o "$OutputDir\$($PDF.BaseName).tiff" $PDF.FullName -c quit
}
