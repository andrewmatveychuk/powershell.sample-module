# powershell.sample-module

Sample CI/CD pipeline for a PowerShell module

## Build Status

Build Status

NuGet Package

## Introduction

This repository contains the source code for a sample PowerShell module along with Azure DevOps pipeline configuration to perform all build, test and publish tasks.

## Getting Started

Clone the repository to your local machine and look for project artifacts in the following locations:

* [SampleModule]() - source code for the module itself along with tests
* [SampleModule.build.ps1]() - build script for the module
* [SampleModule.depend.psd1]() - managing module dependencies with PSDepend
* build - this folder will be created during the build process and will contain the build artifacts

## Build and Test

This project uses [InvokeBuild](https://github.com/nightroman/Invoke-Build) module to automate build tasks such as running test, performing static code analysis, assembling the module, etc.

* To build the module, run: Invoke-Build
* To see other build options: Invoke-Build ?

## Suggested tools

* Editing - [Visual Studio Code](https://github.com/Microsoft/vscode)
* Runtime - [PowerShell Core](https://github.com/powershell)
* Testing - [Pester](https://github.com/Pester/Pester)
* Code coverage - [Pester](https://pester.dev/docs/usage/code-coverage)
* Static code analysis - [PSScriptAnalyzer](https://github.com/PowerShell/PSScriptAnalyzer)
* Dependency management - [PSDepend](https://github.com/RamblingCookieMonster/PSDepend)
* Build tool - [InvokeBuild](https://github.com/nightroman/Invoke-Build)
* Documentation generation - [PlatyPS](https://github.com/PowerShell/platyPS)
