# cerner_2tothe5th_2021
# Script to list the fun fact of a number
#
# How to setup and run powershell for a mac user? 
#   brew install --cask powershell
#   pwsh number_fact.ps1 <number>
# Example:
#   pwsh number_fact.ps1 32

Invoke-RestMethod -Uri "http://numbersapi.com/$($args[0])" -Method GET
