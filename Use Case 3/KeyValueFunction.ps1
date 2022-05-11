<#
    .DESCRIPTION
    This Powershell Function fetches key value(s) for the given object

    .PARAMETER
    InputString - JSON syntax based input
    Key - '/' seperated string for fetching value(s)

    .EXAMPLE
    $InputString = '{"a":{"b":{"c":"d"}}}'
    $Key = 'a/b/c'
    .\KeyValueFunction.ps1
    
    .OUTPUT
    The associated value(s) for a/b/c is : "d"

    .EXAMPLE USAGE
    $InputString = '{"x":{"y":{"z":"a"}}}'
    $Key = 'x/y'
    .\KeyValueFunction.ps1
    
    .OUTPUT
    The associated value(s) for key x/y is : { "z":  "a"}

#>

function ReturnKeyValue
{
    param ([string]$InputString,[string]$Key) 


    $JsonString = $InputString | ConvertFrom-Json
    $Keys = $Key.split("/")

    foreach($K in $Keys)
    {
        $Output = $JsonString.$K
        $JsonString = $Output
    }

    $FinalOutput = $Output | ConvertTo-Json
    Write-Host "The associated value(s) for key $Key is :" $FinalOutput

}

#Function Call

ReturnKeyValue -InputString $InputString -Key $Key