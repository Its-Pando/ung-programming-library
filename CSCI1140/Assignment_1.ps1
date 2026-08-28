##### Assignment 1 - Script Programming Spring 2027

### Question 1: User Welcome Message
# $username = Read-Host -Prompt "Please enter your Username "
# $college = Read-Host -Prompt "Please enter your college "
# Write-Host "Hello $username! Welcome to $college college."


### Question 2: List Browser Processes
# Get-Process -Name Opera


### Question 3: File System and Directory Management
# Get-ChildItem C:\ -Force | Sort-Object Name | Select-Object Name, Mode, LastWriteTime


### Question 4: Process and System Resource Management
# Get-Process | Select-Object ProcessName, ID, @{
#     Name = "MemoryMB"
#     Expression = {
#         [Math]::Round($_.WS/1MB, 2)
#     }
# } -First 15 | Sort-Object MemoryMB -Descending


### Question 5: File Hash Calculation in Powershell
### Q5. 1               
# function FileHashfunction ($path) {
#     $sha512_value = Get-FileHash -Path $path -Algorithm MD5 | Select-Object -Property Hash
#     $md5_value = Get-FileHash -Path $path -Algorithm SHA512 | Select-Object -Property Hash
#     return "MD5: $($md5_value.Hash)
# SHA512: $($sha512_value.Hash)"
# }

# $input_path = Read-Host -Prompt "Enter file path"
# Write-Host "$(FileHashfunction($input_path))"


### Q5. 2            
# function AdvancedFileHashfunction {
#     [CmdletBinding()]
#     param (
#         [Parameter(Mandatory=$True)]
#         [string]$path
#     )
#     process {
#         $md5_value = Get-FileHash -Path $path -Algorithm MD5 | Select-Object -Property Hash
#         $sha1_value = Get-FileHash -Path $path -Algorithm SHA1 | Select-Object -Property Hash
#         $sha256_value = Get-FileHash -Path $path -Algorithm SHA256 | Select-Object -Property Hash
#         $sha512_value = Get-FileHash -Path $path -Algorithm SHA512 | Select-Object -Property Hash
#         Write-Host "MD5: $($md5_value.hash) `nSHA1: $($sha1_value.hash) `nSHA256: $($sha256_value.hash) `nSHA512: $($sha512_value.hash)"
#     }
# }

# $userinput = Read-Host -Prompt "Enter file path"
# AdvancedFileHashfunction($userinput)


### Question 6: Data Generation and File Output
# function CreatePhoneNumbers {
#     $threedigit = 000
#     $areacode = 678

#     while ($threedigit -le 999) {
#         # Generate phone numbers and append to file
#         for ($num = 0; $num -le 9999; $num++) {
#             $text = "($areacode)-$threedigit-$($num.ToString("000"))"
#             Out-File -FilePath "C:\Users\cbray\Downloads\PhoneBook.txt" -Append -InputObject $text
#         }
#         $threedigit++

#         # Change area code to 770 after writing all 678 numbers
#         if ($threedigit -eq 1000) {
#             $areacode = 770
#             $threedigit = 000
#         }
#     }
# }

# CreatePhoneNumbers


### Question 7: System Monitoring
# $name = (Get-CimInstance Win32_ComputerSystem).Name
# $bootuptime = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
# $days = ((Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootUpTime).TotalDays
# Write-Host "Computer Name: $name `nLast Bootup Time: $bootuptime `nTotal Uptime (in days): $([Math]::Round($days, 2))"
















