while ($true) {
netstat -ano |findstr.exe ":443"
Start-Sleep 10
}