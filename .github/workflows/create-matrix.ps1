param(
  [String]$element = "db"
#   [String[]]$array,
)

$Raw = $false
# $element = "db"
[String[]]$array = ('db1', 'db2')
$elements = @()

@($array) | ForEach-Object {
    $elements += @{
        db = $_
    }
}

# Output the result for consumption by GH Actions
#Write-Host "::set-output name=matrix::$($($elements | ConvertTo-JSON -Compress) -replace '([\\]*)"', '$1$1\"'))"
return $($elements | ConvertTo-JSON -Compress)
