

#### Write-Host: Display the output on the terminal window
# write-Host "Hello World"


##### Write-Output: If you want to output the result to the outFile, you should use Write-Output cmdlet
# write-Output "Hello World"


##### Pipeline Operator | : Execute the Get-Process cmdlet ad get the result from it then send this result to Format-List cmdlet
# get-process | Format-List


##### Output the result to the outFile
# Write-Output "Hello World" >> C:\Users\cbray\Documents\VS Code\UNG_Script_Programming_Fall2026\Powershell\results.txt


##### Out-File cmdlet output the result to the outFile
# Write-Output "Hello World" | Out-File C:\Users\cbray\Documents\VS_Code\UNG_Script_Programming_Fall2026\Powershell\results.txt


##### Read-Host cmdlet takes in user input
# $name = Read-Host "State your name"
# Write-Output $name


##### Creates a file called results.txt and inputs "Pulled from file." It then pulls the content of that file, saves content to the variable, and then prints the variable
# Write-Output "Pulled from file" | Out-File C:\Users\cbray\Documents\VS_Code\UNG_Script_Programming_Fall2026\Powershell\results.txt
# $content = Get-Content "C:\Users\cbray\Documents\VS_Code\UNG_Script_Programming_Fall2026\Powershell\results.txt"
# Write-Output $content


##### Get-ChildItem: list all files/folders under the current directory. Under the Mode column: d stands for directory(folder); - stands for files; r stands for read only. If we want to find all hidden files/folders, we can add -Force parameter
# Get-ChildItem c:\ -Force


##### Append
# Instead of using *| Out-File "path"* to append, use *>> "path"* instead

##### Output result to CSV file
##### For Get-Process: each process object has the following properties
##### Process/Name: -processName or -name
##### ID: process ID or PID
##### CPU(s): total CPU time (seconds)
##### WS(M): WorkingSet64, physical memory used at the current(megabytes)
##### PM(M): page memory, memory can be paged out to the disk
##### NPM: None-page memory, kernal memory cannot be paged out to the disk
##### Handles: number of open handles
##### Using Out-File gives a small glimpse of the information
# Get-Process | Out-File "C:\Users\cbray\Documents\VS_Code\UNG_Script_Programming_Fall2026\Powershell\results.csv" # <--- CSV now
##### Using Export-csv gives a much larger view of the information
# Get-Process | Export-Csv "C:\Users\cbray\Documents\VS_Code\UNG_Script_Programming_Fall2026\Powershell\exportcsvresults.csv"


##### Convert the result to HTML file
# Get-Process | ConvertTo-HTML | Out-File "C:\Users\cbray\Documents\VS_Code\UNG_Script_Programming_Fall2026\Powershell\htmlresults.html" # <--- HTML now


##### Only find chrome and powershell two running process information
##### Proprty name to find them: -processName as parameter
# Get-Process -processName chrome, pwsh


##### Prompt Input
# $name = Read-Host -Prompt "Enter your name"
# $color = Read-Host -Prompt "Favorite color?"
# Write-Output " Welcome $name to the CSCI 1411 class!"


##### Arithmatic
# $x = 10
# $y = 10
# $results = $x + $y
# Write-Output $results


##### Random
# 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 | Get-Random
# 1..10 | Get-Random
# Get-Random -Minimum 1 -Maximum 10

# 'A', 'B', 'C', 'D' | Get-Random
# $options = 'A', 'B', 'C', 'D'
# $options | Get-Random


##### Get-Service
##### object: data(property) and action(method)
##### Powershell cmdlet returns object
# $services = Get-Service
##### Access each service object's property
# Write-Host $services.Name
# Write-Host $services.Status
# Get-Service -Name Power
# Get-Service -Status Running


##### Example 1: FInda all stopped (or running) services on the local computer
##### Where-Object sets up the conditional check
# Get-Service | Where-Object -Property Status -EQ Stopped | Select-Object DisplayName, Status, ServiceType


##### Example 2: find all process which CPU larger than 100 MB
##### Method 1
# Get-Process | Where-Object -Property CPU -GT 100MB
##### Method 2
# Get-Process | 
#     Where-Object {$_.CPU -gt 50MB} |
#          Sort-Object CPU |
#             Select-Object Name, CPU, WS -First 5


##### ForEach-Object with if statement
# Get-Process | ForEach-Object {
#                 if ($_.WS -gt 100MB) {
#                     "$($_.ProcessName): Memory Usage is larger than 100MB "
#                 }
#             }


##### Example 4: Rename the property name at Output
Get-Process | Select-Object @{
    Name = "Working Set: Length Size MB" 
    Expression = {
        [Math]::Round($_.WS/1MB, 2)
    }
}, CPU, ID, ProcessName -First 5

















