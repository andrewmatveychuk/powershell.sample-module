$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "'Get-RandomGuid' Function Functional Tests" {

    Context "Accepting input data" {

        #region Arrange
        $inputData = 10
        #endregion

        #region Act&Assert
        It "should accept input from the parameter" {
            $guids = Get-RandomGuid -Number $inputData
            $guids | Should -HaveCount $inputData
        }

        It "should accept input from the pipeline" {
            $guids = $inputData | Get-RandomGuid
            $guids | Should -HaveCount $inputData
        }
        #endregion
    }

}