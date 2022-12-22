function Get-CloudletLoadBalancingVersion
{
    Param(
        [Parameter(Mandatory=$true)]  [string] $OriginID,
        [Parameter(Mandatory=$true)]  [string] $Version,
        [Parameter(Mandatory=$false)] [switch] $Validate,
        [Parameter(Mandatory=$false)] [string] $EdgeRCFile = '~\.edgerc',
        [Parameter(Mandatory=$false)] [string] $Section = 'default',
        [Parameter(Mandatory=$false)] [string] $AccountSwitchKey
    )

    # nullify false switches
    $ValidateString = $Validate.IsPresent.ToString().ToLower()
    if(!$Validate){ $ValidateString = '' }

    if($Version -eq 'latest'){
        $Versions = List-CloudletLoadBalancingVersions -OriginID $OriginID -EdgeRCFile $EdgeRCFile -Section $Section -AccountSwitchKey $AccountSwitchKey
        $Versions = $Versions | Sort-Object -Property Version -Descending
        $Version = $Versions[0].version
    }
    
    $Path = "/cloudlets/api/v2/origins/$OriginID/versions/$Version`?validate=$ValidateString&accountSwitchKey=$AccountSwitchKey"

    try {
        $Result = Invoke-AkamaiRestMethod -Method GET -Path $Path -EdgeRCFile $EdgeRCFile -Section $Section
        return $Result
    }
    catch {
        throw $_
    }
}