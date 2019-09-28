### Get User Inputs for Domain, City & Country. These Inputs Will Be Used For All Users ###
$domain = Read-Host -Prompt 'Input the domain name'
$city = Read-Host -Prompt 'Input a City'
$country = Read-Host -Prompt 'Input a Country(ISO Alpha-2 code) '

Write-Host "Creating Users - Please Wait"

### Import Username's From List ### 

### Please Provide Path To Username File ###

$userlist=IMPORT-CSV "C:\Temp\Usernames.csv"

$i=0
foreach ($user in $userlist)
{

$name = $user.fname.Trim()+" "+$user.lname.Trim()
$upn = $user.fname.Trim()+"."+$user.lname+"@"+$domain
$sam = $user.fname.Trim()+"."+$user.lname
  
New-ADUser   -AccountPassword (ConvertTo-SecureString “P@ssw0rd123” -AsPlainText -Force)     -City $city    -Country $country    -DisplayName $name    -EmailAddress $upn    -Enabled $true    -GivenName $user.fname    -Name $name    -Organization $Organization    -SamAccountName $sam    -Surname $user.lname    -UserPrincipalName $upn

Write-Host “Created user :” $name

$i++
}

Write-Host $i "Users Have Been Created."
Write-Host $i "The Password For All Users Is: P@ssw0rd123"
