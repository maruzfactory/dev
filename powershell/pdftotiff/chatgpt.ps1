# Ghostscriptのパスを設定
$ghostscriptPath = "C:\Users\Maruyama Hiroshi\Desktop\pdftiff\gs10.02.1\bin\gswin64c.exe"

# 出力するPDFファイルのパスを指定
$outputPDFPath = "C:\Users\Maruyama Hiroshi\Desktop\pdftiff\tiff\output.pdf"

# 出力するTIFFファイルのパスを指定
$outputTIFFPath = "C:\Users\Maruyama Hiroshi\Desktop\pdftiff\tiff\output.tiff"

# Aフォルダ内の全てのPDFファイルを取得
$pdfFiles = Get-ChildItem -Path "C:\Users\Maruyama Hiroshi\Desktop\pdftiff\pdf" -Filter *.pdf

# Ghostscriptを使ってPDFファイルを結合
$pdfArgs = @("-q", "-dNOPAUSE", "-sDEVICE=pdfwrite", "-sOutputFile=$outputPDFPath", "-dBATCH")
$pdfArgs += $pdfFiles.FullName
& $ghostscriptPath @pdfArgs

# Ghostscriptを使ってPDFをTIFFに変換
$tiffArgs = @("-q", "-dNOPAUSE", "-sDEVICE=tiffg4", "-r300", "-sOutputFile=$outputTIFFPath", "-dBATCH", $outputPDFPath)
& $ghostscriptPath @tiffArgs

Remove-item "C:\Users\Maruyama Hiroshi\Desktop\pdftiff\tiff\output.pdf"
Write-Host "Conversion completed."
