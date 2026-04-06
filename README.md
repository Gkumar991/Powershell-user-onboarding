# M365 User Onboarding Automation (PowerShell)

## Overview
This project automates Microsoft 365 user onboarding using PowerShell and Microsoft Graph.

It allows IT admins to:

- Create new users  
- Update existing users  
- Assign licenses  
- Bulk process users using a CSV file  

This simplifies repetitive tasks and makes user management **scalable and error-free**.

---

## Prerequisites

### 1. Install Microsoft Graph Modules

```powershell
Install-Module Microsoft.Graph -Scope CurrentUser
Import-Module Microsoft.Graph
Import-Module Microsoft.Graph.Users
Import-Module Microsoft.Graph.Authentication

---

### ✅ 2. Check Modules

```markdown
## Verify Installed Modules

```powershell
Get-Module -ListAvailable Microsoft.Graph*


---

### ✅ 3. Connect to M365

```markdown
## Connect to Microsoft 365

```powershell
Connect-MgGraph -Scopes "User.ReadWrite.All","Directory.ReadWrite.All"


---

### ✅ 4. Run Script

```markdown
## Run the Script

```powershell
cd C:\Users\shash\Powershell-onboard
.\OnboardUsersSimple.ps1


---

### ✅ 6. Git Commands

```markdown
## Git Commands

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin <repo-url>
git push -u origin main


