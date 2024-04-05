$steamProcesses = Get-Process | Where-Object { $_.ProcessName -eq "Steam" }

# Set command prompt colors
$host.UI.RawUI.BackgroundColor = "Magenta"
$host.UI.RawUI.ForegroundColor = "Pink"  # Pink color for a girlish touch
Clear-Host

# Display ASCII art (girlish catgirl)
Write-Host @"
     /\\_/\\
    ( o.o )  Meow~!
    > ^ <
"@

# Display title
Write-Host "-----------------------"
Write-Host "   Steam Slayer  "
Write-Host "-----------------------"

if ($steamProcesses) {
    Write-Host "Killing those pesky Steam processes..."
    
    # Simulate a loading animation
    $animation = @("/","-","\\","|")
    foreach ($frame in $animation) {
        Write-Host -NoNewline "Processing $frame`r"
        Start-Sleep -Milliseconds 200
    }
    
    $steamProcesses | Stop-Process -Force
    Write-Host "`nSteam processes have been vanquished!"
} else {
    Write-Host "No Steam processes found. The realm is peaceful~"
}

# Reset command prompt colors
$host.UI.RawUI.BackgroundColor = "Black"
$host.UI.RawUI.ForegroundColor = "White"

# Prompt user to press any key before exiting
Write-Host "`nMrr... Press any key to exit~"
$null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
