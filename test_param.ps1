function test_param 
{

Param(
#      [Parameter(Mandatory=$True,Position=0)]
      [String]$BUILDNUM,
#      [Parameter(Mandatory=$True,Position=1)]
      [ValidateSet("slc", "sjr", "lvs")]
      [String]$ENV
      )

Write-Host the fisrt param is $BUILDNUM, and second param is $ENV  
Write-Host You have provided $PSBoundParameters.Count param. 

If ($PSBoundParameters.Count -lt 2)
{
Write-Host "Usage: test_param BUILDNUM ENV"
}
#switch ($ENV)
#
#{
#"slc" {$gp_servers = @("SLCD000GPF001","SLCD000GPR001","SLCD000GPU001")}
#"sjr" {$gp_servers = @("SJRC01GPF001","SJRC01GPF002","SJRC01GPF003","SJRC01GPF005","SJRC01GPF999","SJRC01GPR001","SJRC01GPU001","SJRC01GPU002","SJRC02GPF001","SJRC02GPM021","SJRC02GPR021","SJRC02GPU021")}
#"lvs" {$gp_servers = @("LVSC01GPF001","LVSC01GPF999","LVSC01GPM001","LVSC01GPR001","LVSC01GPS001","LVSC01GPU002","LVSC01GPU003","LVSC01IPN002")}
#}
#
#Write-Host Deploy GP chunk version $BUILDNUM to $ENV GP servers $gp_servers
#
#foreach ($gp_server in $gp_servers)
#{
#&cmd /C ping "${gp_server}.stubcorp.com"
#}
#
}

test_param abc