function Generate-APIKeyReport
{
    [CmdletBinding(DefaultParameterSetName = 'attributes')]
    Param(
        [Parameter(Mandatory=$true)] [String] [ValidateSet('rapidkey-by-quota','rapidkey-by-time')] $ReportType,
        [Parameter(Mandatory=$true)] [String] $Version,
        [Parameter(Mandatory=$true)] [String] $Start,
        [Parameter(Mandatory=$true)] [String] $End,
        [Parameter(Mandatory=$true)] [ValidateSet('FIVE_MINUTES','HOUR', 'DAY', 'WEEK', 'MONTH')] [String] $Interval,
        [Parameter(Mandatory=$false, ParameterSetName='attributes')] [string] $APIKeys,
        [Parameter(Mandatory=$false, ParameterSetName='postbody')] [String] $Body,
        [Parameter(Mandatory=$false)] [string] $EdgeRCFile = '~\.edgerc',
        [Parameter(Mandatory=$false)] [string] $Section = 'default',
        [Parameter(Mandatory=$false)] [string] $AccountSwitchKey
    )

    $DateTimeMatch = '[\d]{4}-[\d]{2}-[\d]{2}T[\d]{2}:[\d]{2}:[\d]{2}Z'
    if($Start -notmatch $DateTimeMatch -or $End -notmatch $DateTimeMatch){
        throw "ERROR: Start & End must be in the format 'YYYY-MM-DDThh:mm:ssZ'"
    }

    $Params = "start=$Start&end=$End&interval=$Interval&limit=$Limit&accountSwitchKey=$AccountSwitchKey"
    $EncodedParams = [System.Web.HttpUtility]::UrlEncode($Params)
    $EncodedParams = $EncodedParams.Replace("%3d","=") #Easier to read
    $EncodedParams = $EncodedParams.Replace("%26","&")

    $Path = "/apikey-manager-api/v1/reports/$ReportType/versions/$Version/report-data?$EncodedParams"

    if($PSCmdlet.ParameterSetName -eq 'attributes'){
        $BodyObj = @{ 
            filters = @{}
        }

        # Filters
        if($APIKeys){
            $BodyObj['filters']['api_key'] = ($APIKeys -split ',')
        }

        $Body = ConvertTo-Json -Depth 100 $BodyObj
    }

    try {
        $Result = Invoke-AkamaiRestMethod -Method POST -Path $Path -Body $Body -EdgeRCFile $EdgeRCFile -Section $Section
        return $Result
    }
    catch {
        throw $_.Exception
    }
}