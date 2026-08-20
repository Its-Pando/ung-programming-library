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
















