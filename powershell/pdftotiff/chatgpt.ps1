# Ghostscriptのパスを設定
$ghostscriptPath = "gs10.02.1\bin\gswin64c.exe"

# 出力するPDFファイルのパスを指定
$outputPDFPath = "output.pdf"

# 出力するTIFFファイルのパスを指定
$outputTIFFPath = "output.tiff"

# Aフォルダ内の全てのPDFファイルを取得
$pdfFiles = Get-ChildItem -Path "\pdftiff\pdf" -Filter *.pdf

# Ghostscriptを使ってPDFファイルを結合
$pdfArgs = @("-q", "-dNOPAUSE", "-sDEVICE=pdfwrite", "-sOutputFile=$outputPDFPath", "-dBATCH")
$pdfArgs += $pdfFiles.FullName
& $ghostscriptPath @pdfArgs

# Ghostscriptを使ってPDFをTIFFに変換
$tiffArgs = @("-q", "-dNOPAUSE", "-sDEVICE=tiffg4", "-r300", "-sOutputFile=$outputTIFFPath", "-dBATCH", $outputPDFPath)
& $ghostscriptPath @tiffArgs

Remove-item "output.pdf"
Write-Host "Conversion completed."
