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
# ## Users with phone numbers starting with 678 or 770
# Write-Host "`n`nUsers with phone numbers starting with 678 or 770:"
# $data | ForEach-Object {
#     if ($_.phone1 -match "^(678|770)" -or $_.phone2 -match "^(678|770)") {
#         Write-Host $_.first_name $_.last_name $_.city $_.county $_.state $_.phone1 $_.phone2 $_.email
#     }
# }
# ## Users with email addresses ending with .org
# Write-Host "`n`nUsers with email addresses ending with .org:"
# $data | ForEach-Object {
#     if ($_.email -match "\.org$") {
#         Write-Host $_.first_name $_.last_name $_.city $_.county $_.state $_.phone1 $_.phone2 $_.email
#     }
# }


##### Question 3: Credential/Password Protection
# $key = 1..16
# function Encrypt_Password {
#     for ($i = 1; $i -le 10; $i++) {
#         $password = Read-Host -Prompt "Enter a password to encrypt" -AsSecureString
#         ConvertFrom-SecureString -SecureString $password -Key $key | Out-File -FilePath "C:\Users\cbray\Downloads\encryptPW.txt" -Append
#     }
# }

# function Decrypt_Password {
#     $data = Get-Content -Path "C:\Users\cbray\Downloads\encryptPW.txt"
#     foreach ($line in $data) {    
#         $encrypted = ConvertTo-SecureString -String $line -Key $key
#         $encrypted | ConvertFrom-SecureString -AsPlainText
#     }
# }

# Encrypt_Password
# Decrypt_Password


##### Question 4: Base64 Encoding and Decoding in PowerShell
# function EncodeToBase64 {
#     $content = Get-Content -Path "C:\Users\cbray\Downloads\wordlist.txt"
#     foreach ($line in $content) {
#         $bytes = [System.Text.Encoding]::Unicode.GetBytes($line)
#         [System.Convert]::ToBase64String($bytes) | Out-File -FilePath "C:\Users\cbray\Downloads\encoded.txt" -Append
#     }
# }

# function DecodeFromBase64 {
#     $encodedContent = Get-Content -Path "C:\Users\cbray\Downloads\encoded.txt"
#     foreach ($line in $encodedContent) {
#         $bytes = [System.Convert]::FromBase64String($line)
#         $decoded = [System.Text.Encoding]::Unicode.GetString($bytes)
#         Write-Output $decoded
#     }
# }

# EncodeToBase64
# DecodeFromBase64


##### Question 5: File Integrity & Security
# function ComputeFileHash {
#     param (
#         [string]$filePath
#     )
#     $filepath = Read-Host -Prompt "Enter the file path "
#     $hash = Get-FileHash -Path $filePath -Algorithm SHA256
#     $hash.Hash | Out-File -FilePath "C:\Users\cbray\Downloads\hashresult.txt"
# }

# function VerifyFileHash {
#     param (
#         [string]$filepath
#     )
#     $filepath = Read-Host -Prompt "Enter the file path to verify"
#     $testhash = Get-FileHash -Path $filepath -Algorithm SHA256
#     $originalhash = Get-Content -Path "C:\Users\cbray\Downloads\hashresult.txt"
#     if ($testhash -eq $originalhash) {
#         Write-Output "This file is authentic and has not been tampered with."
#     } else {
#         Write-Output "This file has been tampered with."
#     }
# }

# ComputeFileHash
# VerifyFileHash
# | Format-Table -Property LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess, ID -AutoSize

##### Question 6: Network Activity Monitoring
Get-NetTCPConnection | 
    Where-Object {
        $_.RemoteAddress -notmatch "^192.168|10." -or $_.Port -notmatch "80|443|53"
    } | 
    Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State, @{Name = "ProcessName"; Expression = {(Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue).ProcessName}
    } | 
    Format-Table -Property LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess, ID -AutoSize






