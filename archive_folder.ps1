param (
    [string] $pathtozip
)

Write-Host "Starting to compress $pathtozip"
$foldername = (Get-Item $pathtozip).Name
$zipfilename = $foldername+"_"+$(Get-Date -Format FileDate)
$destfile = "C:\nima\backup\"+${zipfilename}
Compress-Archive -Path $pathtozip -CompressionLevel Fastest -DestinationPath $destfile 
Write-Host "$pathtozip is compressed and saved to $destfile"