$connectionString = "Data Source=DEV044_DSN;User Id=siebel;Password=dsiebel;Integrated Security=no"
[System.Reflection.Assembly]::LoadWithPartialName("System.Data.OracleClient") | Out-Null 
$connection = New-Object System.Data.OracleClient.OracleConnection($connectionString)
$connection.Open()
$querystring =  "SELECT T1.LOGIN FROM SIEBEL.S_USER T1, SIEBEL.S_EMP_PER T2, SIEBEL.S_EMPLOYEE_X T3 WHERE (T1.PAR_ROW_ID = T2.PAR_ROW_ID) AND (T2.ROW_ID) = (T3.PAR_ROW_ID (+)) AND (T1.LOGIN IS NOT NULL) AND (T2.EMP_STAT_CD = 'Active') AND (T3.ATTRIB_43 = 'Y') ;"
$command = new-Object System.Data.OracleClient.OracleCommand($queryString, $connection) 

$users = $command.ExecuteReader()
