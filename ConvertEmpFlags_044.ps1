
#[CmdletBinding()]
#Param(
#      [Parameter(Mandatory=$True,Position=1)]
#      [String]$db_password
#)

#output sql

$sql_file = "c:\users\nima\emp_teams.sql"

Add-Content -Path $sql_file -Value "set escape on;"
Add-Content -Path $sql_file -Value "delete from siebel.EIM_EMP_DTL where IF_ROW_BATCH_NUM = 110;"

# Maps S_EMPLOYEE_X columns to Team names

$flags = @("ATTRIB_43","ATTRIB_05")
$teams = @("Complaince","Test")

# db connection string



for ($i=0 ; $i -lt $flags.Length ; $i++)
{

$strSQL = "SELECT T1.LOGIN FROM SIEBEL.S_USER T1, SIEBEL.S_EMP_PER T2, SIEBEL.S_EMPLOYEE_X T3 WHERE (T1.PAR_ROW_ID = T2.PAR_ROW_ID) AND (T2.ROW_ID) = (T3.PAR_ROW_ID (+)) AND (T1.LOGIN IS NOT NULL) AND (T2.EMP_STAT_CD = 'Active') AND (T3."+$flags[$i]+" = 'Y') ;"




}


Add-Content -Path $sql_file -Value "commit;"
Add-Content -Path $sql_file -Value "set escape off;"

write-host "All Done."
