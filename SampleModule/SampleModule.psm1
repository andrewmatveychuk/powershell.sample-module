Set-StrictMode -Version Latest

# Get public and private function definition files
$public = @(Get-ChildItem -Path "$PSScriptRoot\Public\*.ps1" -Exclude "*.Tests.*" -ErrorAction SilentlyContinue)
$private = @(Get-ChildItem -Path "$PSScriptRoot\Private\*.ps1" -Exclude "*.Tests.*" -ErrorAction SilentlyContinue)

# Importing all functions
foreach ($import in @($public + $private)) {
    try {
        Write-Verbose "Importing $($import.FullName)..."
        . $import.FullName
    }
    catch {
        Write-Error "Failed to import function $($import.FullName): $_"
    }
}

# Export public functions
Export-ModuleMember -Function $public.BaseName