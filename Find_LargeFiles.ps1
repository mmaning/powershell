$startFolder = "C:\Users\nima\"
$LargeFiles = @()
$objLargefiles = Get-ChildItem $startFolder -Recurse | Where-Object {$_.Length -gt 100mb} | Sort-Object length -Descending

foreach ($file in $objLargefiles)
{
    $LargeFiles += New-Object -TypeName PSObject -Property @{
    Name = $file.fullname
    Size_MB = [math]::Truncate($file.length /1mb)
    }

}

$LargeFiles | ft -AutoSize

