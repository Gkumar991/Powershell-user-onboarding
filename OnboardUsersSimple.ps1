# Path to CSV
$csvPath = "C:\Users\shash\users.csv"

# Import users
$users = Import-Csv -Path $csvPath

foreach ($user in $users) {

    try {
        $newUser = New-MgUser `
    -AccountEnabled:$true `
    -DisplayName "$($user.FirstName) $($user.LastName)" `
    -MailNickname ($user.UserName.Split("@")[0]) `
    -UserPrincipalName $user.UserName `
    -PasswordProfile @{ ForceChangePasswordNextSignIn = $true; Password = $user.Password } `
    -Department $user.Department

        Write-Host "User $($user.UserName) created." -ForegroundColor Green
    }
    catch {
        Write-Host "Failed to create $($user.UserName): $_" -ForegroundColor Red
        continue
    }

    try {
        $sku = Get-MgSubscribedSku | Where-Object {$_.SkuPartNumber -eq $user.License}
        if ($sku) {
            Add-MgUserLicense -UserId $newUser.Id -AddLicenses @{SkuId = $sku.SkuId} -RemoveLicenses @()
            Write-Host "License assigned to $($user.UserName)" -ForegroundColor Cyan
        }
    }
    catch {
        Write-Host "License failed for $($user.UserName): $_" -ForegroundColor Red
    }
}