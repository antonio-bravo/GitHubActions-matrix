param(
  [String]$element = "db",
  [String[]]$array
)

# $element = "db"
# [String[]]$array = ('db1', 'db2')
$elements = @()
#$countarray = $array.Count

@($array) | ForEach-Object {
    $elements += @{
        db = $_
    }
}

# Output the result for consumption by GH Actions
#Write-Host "::set-output name=matrix::$($($elements | ConvertTo-JSON -Compress) -replace '([\\]*)"', '$1$1\"'))"
#if ($countarray = 1) {
  #add [] when there is only one element in the array
  return $($elements | ConvertTo-JSON -Compress )
# }
# else {
#   return $($elements | ConvertTo-JSON -Compress)
# }

