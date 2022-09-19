param(
#   [String]$element = "db",
#   [String[]]$array,
  [Switch]$Raw 
)

$Raw = $false
# $element = "db"
[String[]]$array = ("db1", "db2")
$elements = @()

@($array) | ForEach-Object {
    $elements += @{
        db = $_
    }
}

# if ($Raw) {
    Write-Host $($elements.replace('"','\"') | ConvertTo-JSON -Compress)
  # } else {
    # Output the result for consumption by GH Actions
    Write-Host "::set-output name=matrix::$($elements.replace('"','\"') | ConvertTo-JSON -Compress)"
  # }