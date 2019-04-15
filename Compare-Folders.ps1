

$ReferObj = Get-ChildItem $Path1
$DiffObj = Get-ChildItem $Path2
Compare-Object -ReferenceObject $ReferObj -DifferenceObject $DiffObj

