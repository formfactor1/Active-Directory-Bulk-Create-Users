<#
.Title
Bulk create active directory users
.Description
Bulk create active directory users based on the values of a csv file.
.How To Use
The csv should contain the following headers
Name,GivenName,Surname,SamAccountName,UserPrincipalName
.Created By
Nathan Studebaker
#>

#Import the csv and create the users
Import-Csv C:\support\user-list.csv | New-ADUser -PassThru | `
Set-ADAccountPassword -Reset ` -NewPassword (ConvertTo-SecureString -AsPlainText 'Pa$$w0rd01' -Force) `
-PassThru | Enable-ADAccount #Be mindful off the ' in the two lines above

