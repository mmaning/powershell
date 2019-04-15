function Compare-Folder 
{
    param (
        $Path1,
        $Path2
    )




}

$ReferObj = Get-ChildItem $Path1
$DiffObj = Get-ChildItem $Path2
Compare-Object -ReferenceObject $ReferObj -DifferenceObject $DiffObj

