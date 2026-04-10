# Build script - assembles index.html from parts
$parts = @()
Get-ChildItem -Path ".\parts" -Filter "*.html" | Sort-Object Name | ForEach-Object {
    $parts += Get-Content $_.FullName -Raw
}
$parts -join "`n" | Set-Content -Path ".\index.html" -Encoding UTF8
Write-Host "Built index.html successfully! Size: $((Get-Item .\index.html).Length) bytes"
