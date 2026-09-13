##### Assignment 2 - Script Programming Spring 2027


##### Question 1: Log Analysis -> System Event Investigation
# Get-WinEvent -FilterHashtable @{LogName="System"; Level=2, 3;} -MaxEvents 10 | Format-Table TimeCreated, ProviderName, Id, LevelDisplayName, Message -AutoSize | Out-File -FilePath "C:\Users\Public\Documents\SystemErrorsWarnings.txt"


##### Question 2: File Search and Regular Expressions
# $data = Import-CSV -path "C:\Users\cbray\Downloads\sample_data.csv"
### Users from Fulton County
# Write-Host "`n`nUsers from Fulton County:"
# $data | ForEach-Object {
#     if ($_.county -eq "Fulton") {
#         Write-Host $_.first_name $_.last_name $_.city $_.county $_.state $_.phone1 $_.phone2 $_.email
#     }
# }
### Users with phone numbers starting with 678 or 770
# Write-Host "`n`nUsers with phone numbers starting with 678 or 770:"
# $data | ForEach-Object {
#     if ($_.phone1 -match "^(678|770)" -or $_.phone2 -match "^(678|770)") {
#         Write-Host $_.first_name $_.last_name $_.city $_.county $_.state $_.phone1 $_.phone2 $_.email
#     }
# }
### Users with email addresses ending with .org
# Write-Host "`n`nUsers with email addresses ending with .org:"
# $data | ForEach-Object {
#     if ($_.email -match "\.org$") {
#         Write-Host $_.first_name $_.last_name $_.city $_.county $_.state $_.phone1 $_.phone2 $_.email
#     }
# }


##### Question 3: Credential/Password Protection
function Encrypt_Password {
    for ($i = 1; $i -le 2; $i++) {
        $password = Read-Host -Prompt "Enter a password to encrypt" -AsSecureString
        ConvertFrom-SecureString -SecureString $password -key (1..16) | Out-File -FilePath "C:\Users\cbray\Downloads\encryptPW.txt" -Append
    }
}

##### Decrypts Password using ConvertFrom-SecureString and the same key used for encryption
function Decrypt_Password {
    $data = Get-Content -Path "C:\Users\cbray\Downloads\encryptPW.txt" | ConvertTo-SecureString -key (1..16)
    $data | ConvertFrom-SecureString -AsPlainText
}

Encrypt_Password
Decrypt_Password




















