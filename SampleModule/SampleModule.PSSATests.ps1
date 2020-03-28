$here = Split-Path -Parent $MyInvocation.MyCommand.Path

$modulePath = $here
$moduleName = Split-Path -Path $modulePath -Leaf

Describe "'$moduleName' Module Analysis with PSScriptAnalyzer" {
    Context 'Standard Rules' {
        $analysis = Invoke-ScriptAnalyzer -Path "$here\$moduleName.psm1"
        $scriptAnalyzerRules = Get-ScriptAnalyzerRule

        forEach ($rule in $scriptAnalyzerRules) {
            It "should pass '$rule' rule" {
                If ($analysis.RuleName -contains $rule) {
                    $analysis | Where-Object RuleName -EQ $rule -OutVariable failures | Out-Default
                    $failures.Count | Should -Be 0
                }
            }
        }
    }
}

# Dynamically defining the functions to analyze
$functionPaths = @()
if (Test-Path -Path "$modulePath\Private\*.ps1") {
    $functionPaths += Get-ChildItem -Path "$modulePath\Private\*.ps1" -Exclude "*.Tests.*"
}
if (Test-Path -Path "$modulePath\Public\*.ps1") {
    $functionPaths += Get-ChildItem -Path "$modulePath\Public\*.ps1" -Exclude "*.Tests.*"
}

# Running the analysis for each function
foreach ($functionPath in $functionPaths) {
    $functionName = $functionPath.BaseName

    Describe "'$functionName' Function Analysis with PSScriptAnalyzer" {
        Context 'Standard Rules' {
            $analysis = Invoke-ScriptAnalyzer -Path $functionPath
            $scriptAnalyzerRules = Get-ScriptAnalyzerRule

            forEach ($rule in $scriptAnalyzerRules) {
                It "should pass '$rule' rule" {
                    If ($analysis.RuleName -contains $rule) {
                        $analysis | Where-Object RuleName -EQ $rule -OutVariable failures | Out-Default
                        $failures.Count | Should -Be 0
                    }
                }
            }
        }
    }
}