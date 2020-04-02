# powershell.sample-module

A sample CI/CD pipeline for a PowerShell module.

Before starting to work with this sample project, I suggest reading the information in the following blog posts:

* [A sample CI/CD pipeline for PowerShell module](https://andrewmatveychuk.com/a-sample-ci-cd-pipeline-for-powershell-module/)

## Build Status

[![Build Status](https://dev.azure.com/matveychuk/powershell.sample-module/_apis/build/status/andrewmatveychuk.powershell.sample-module?branchName=master)](https://dev.azure.com/matveychuk/powershell.sample-module/_build/latest?definitionId=4&branchName=master)

[![SampleModule package in AMGallery feed in Azure Artifacts](https://feeds.dev.azure.com/matveychuk/cb70e260-566b-4d91-9f8f-81840641e8f3/_apis/public/Packaging/Feeds/86bae25a-d541-4a81-957a-21549283fca5/Packages/683d9381-327e-4f38-9539-2c2746f52cb3/Badge)](https://dev.azure.com/matveychuk/powershell.sample-module/_packaging?_a=package&feed=86bae25a-d541-4a81-957a-21549283fca5&package=683d9381-327e-4f38-9539-2c2746f52cb3&preferRelease=true)

## Introduction

This repository contains the source code for a sample PowerShell module along with Azure DevOps pipeline configuration to perform all build, test and publish tasks.

## Getting Started

Clone the repository to your local machine and look for project artifacts in the following locations:

* [SampleModule](https://github.com/andrewmatveychuk/powershell.sample-module/tree/master/SampleModule) - source code for the module itself along with tests
* [SampleModule.build.ps1](https://github.com/andrewmatveychuk/powershell.sample-module/blob/master/SampleModule.build.ps1) - build script for the module
* [SampleModule.depend.psd1](https://github.com/andrewmatveychuk/powershell.sample-module/blob/master/SampleModule.depend.psd1) - managing module dependencies with PSDepend
* build - this folder will be created during the build process and will contain the build artifacts

## Build and Test

This project uses [InvokeBuild](https://github.com/nightroman/Invoke-Build) module to automate build tasks such as running test, performing static code analysis, assembling the module, etc.

* To build the module, run: Invoke-Build
* To see other build options: Invoke-Build ?

## Suggested tools

* Editing - [Visual Studio Code](https://github.com/Microsoft/vscode)
* Runtime - [PowerShell Core](https://github.com/powershell)
* Build tool - [InvokeBuild](https://github.com/nightroman/Invoke-Build)
* Dependency management - [PSDepend](https://github.com/RamblingCookieMonster/PSDepend)
* Testing - [Pester](https://github.com/Pester/Pester)
* Code coverage - [Pester](https://pester.dev/docs/usage/code-coverage)
* Static code analysis - [PSScriptAnalyzer](https://github.com/PowerShell/PSScriptAnalyzer)
