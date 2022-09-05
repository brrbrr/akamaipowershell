function Set-APIThrottlingCounter
{
    Param(
        [Parameter(Mandatory=$true)] [string] $CounterID,
        [Parameter(Mandatory=$true,ParameterSetName='pipeline',ValueFromPipeline=$true)] [object] $Counter,
        [Parameter(Mandatory=$true,ParameterSetName='body')] [string] $Body,
        [Parameter(Mandatory=$false)] [string] $EdgeRCFile = '~\.edgerc',
        [Parameter(Mandatory=$false)] [string] $Section = 'default',
        [Parameter(Mandatory=$false)] [string] $AccountSwitchKey
    )

    begin {}

    process {
        if($Counter){
            $Body = ConvertTo-Json $Counter -Depth 100
        }

        $Path = "/apikey-manager-api/v1/counters/$CounterID`?accountSwitchKey=$AccountSwitchKey"

        try {
            $Result = Invoke-AkamaiRestMethod -Method PUT -Path $Path -Body $Body -EdgeRCFile $EdgeRCFile -Section $Section
            return $Result
        }
        catch {
            throw $_ 
        }
    }

    end {}

}