function List-LDSLogConfigurationForID
{
    Param(
        [Parameter(Mandatory=$false)] [string] $logSourceType = "cpcode-products",
        [Parameter(Mandatory=$true)]  [string] $logSourceId,
        [Parameter(Mandatory=$false)] [string] $EdgeRCFile = '~\.edgerc',
        [Parameter(Mandatory=$false)] [string] $Section = 'default',
        [Parameter(Mandatory=$false)] [string] $AccountSwitchKey
    )

    # Check creds
    $Credentials = Get-AKCredentialsFromRC -EdgeRCFile $EdgeRCFile -Section $Section
    if(!$Credentials){ return $null }

    $ReqURL = "https://" + $Credentials.host + "/lds-api/v3/log-sources/$logSourceType/$logSourceId/log-configurations?accountSwitchKey=$AccountSwitchKey"
    
    try {
        $Result = Invoke-AkamaiOPEN -Method GET -ClientToken $Credentials.client_token -ClientAccessToken $Credentials.access_token -ClientSecret $Credentials.client_secret -ReqURL $ReqURL
        return $Result 
    }
    catch {
        throw $_.Exception
    }
}