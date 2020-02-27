<# 
PowerShell Lab 3 Files and If

Vonscher Schiung
Lab 3 Files and if.ps1
02/20/2020

#>

Clear-Host
Set-Location -Path $env:USERPROFILE 
Get-ChildItem -Filter *.txt | Format-Table Name, Length


$Want = @" 
Your choice
    1.Write a contact entry to a file
    2.Display all files last Written to after a given date
    3.Read a specified text file
"@
$Want
$Choice = Read-host "Enter the Number of your choice"

if ($choice -eq 1) {
    Write-Output "Write a contact entry to a file"
    $Name = Read-Host "Enter Full Name"
    $Phone = Read-Host "Enter Phone Number"
    $Email = Read-Host "Enter Email address"
    $blanks = read-host
    Add-Content C:\Users\schvonm\Desktop\testfile.txt $Name, n$Phone, n$Email
    Add-Content C:\Users\schvonm\Desktop\testfile.txt $blanks
}
elseif ($choice -eq 2) {
    Write-Output "Display all files last Weitten to after a given date"
    $File = Read-Host "Earliest date of file to display"
    Get-ChildItem -Path $env:USERPROFILE | Where-Object {$_.LastWriteTime.Date -ge $File} | Format-Table Name, LastWriteTime
}
elseif ($choice -eq 3) {
    Write-Output "Read s specified text file"
    $Files = Read-host "Enter a Text File"
        If(Test-Path -path C:\Users\schvonm\Desktop\$Files -IsValid) {Get-Content -Path C:\Users\schvonm\Desktop\$Files}
        elseif (Write-Output "Files doesn't Exist"){
            }
}
else {
    Write-Output "You choose $choice"
    $Computername = $env:COMPUTERNAME
    $name = $env:Username
    Write-Output "$name have enter an invalid repsonse on $Computername"

}