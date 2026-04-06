# Connect to Microsoft 365 first
# Connect-MgGraph -Scopes "User.ReadWrite.All","Directory.ReadWrite.All"

# Path to your CSV (make sure the CSV is in the same folder as the script)
$csvPath = ".\users.csv"

# Import users from CSV
$users = Import-Csv -Path $csvPath

foreach ($user in $users) {

    # Check if user exists
    $existingUser = Get-MgUser -UserId $user.UserName -ErrorAction SilentlyContinue

    if ($existingUser) {
        # Update existing user
        try {
            Update-MgUser -UserId $user.UserName `
                -DisplayName "$($user.FirstName) $($user.LastName)" `
                -Department $user.Department
            Write-Host "User $($user.UserName) updated." -ForegroundColor Green
        }
        catch {
            Write-Host "Failed to update $($user.UserName): $_" -ForegroundColor Red
        }
    }
    else {
        # Create new user
        try {
            $newUser = New-MgUser `
                -AccountEnabled:$true `
                -DisplayName "$($user.FirstName) $($user.LastName)" `
                -MailNickname ($user.UserName.Split("@")[0]) `
                -UserPrincipalName $user.UserName `
                -PasswordProfile @{ ForceChangePasswordNextSignIn = $true; Password = $user.Password } `
                -Department $user.Department
            Write-Host "User $($user.UserName) created." -ForegroundColor Cyan
        }
        catch {
            Write-Host "Failed to create $($user.UserName): $_" -ForegroundColor Red
            continue
        }
    }

    # Assign license (works for both new and existing users)
    try {
        $sku = Get-MgSubscribedSku | Where-Object {$_.SkuPartNumber -eq $user.License}
        if ($sku) {
            Update-MgUserLicense -UserId $user.UserName -AddLicenses @{SkuId = $sku.SkuId} -RemoveLicenses @()
            Write-Host "License assigned to $($user.UserName)" -ForegroundColor Yellow
        }
        else {
            Write-Host "License $($user.License) not found for $($user.UserName)" -ForegroundColor Magenta
        }
    }
    catch {
        Write-Host "Failed to assign license for $($user.UserName): $_" -ForegroundColor Red
    }
}

Write-Host "All users processed." -ForegroundColor White