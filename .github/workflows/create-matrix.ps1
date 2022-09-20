# param(
# #   [String]$element = "db",
# #   [String[]]$array,
#   [Switch]$Raw 
# )

# $Raw = $false
# # $element = "db"
# [String[]]$array = ('db1', 'db2')
# $elements = @()

# @($array) | ForEach-Object {
#     $elements += @{
#         db = $_
#     }
# }

#  if ($Raw) {
#     Write-Host (($elements | ConvertTo-JSON -Compress) -replace '([\\]*)"', '$1$1\"'))
#   } else {
#     # Output the result for consumption by GH Actions
#     #Write-Host "::set-output name=matrix::$($($elements | ConvertTo-JSON -Compress) -replace '([\\]*)"', '$1$1\"'))"
#      Write-Host ($($elements | ConvertTo-JSON -Compress) -replace '([\\]*)"', '$1$1\"')
     
#   }

$Jobs = @()

@('ubuntu-latest', 'windows-latest') | ForEach-Object {
  $Jobs += @{
    job_name = "Run $_ jobs"
    os = $_
    command = "$_ command"
    db = $_
  }
}

Write-Host "::set-output name=matrix::$($Jobs | ConvertTo-JSON -Compress))"