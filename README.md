# M365 User Onboarding Automation

## About the Project
This project automates user onboarding in Microsoft 365 using PowerShell. 
I started with a trial M365 Business Standard subscription and learned to:
- Install and import Microsoft Graph modules
- Connect PowerShell to M365
- Bulk onboard users from a CSV file
- Assign licenses and groups automatically

This project was created to practice automation, version control, and real-world IT admin tasks.

## Workflow Story
1. Created GitHub repository for project
2. Installed PowerShell modules (Microsoft.Graph)
3. Generated SSH key and connected GitHub
4. Created `users.csv` for bulk onboarding
5. Wrote PowerShell script `OnboardUsersSimple.ps1`
6. Connected to M365 and ran script
7. Verified users and licenses in Admin Centre
8. Pushed code and CSV to GitHub for version tracking

## How to Run
1. Prepare `users.csv` with columns: FirstName, LastName, Email, Department
2. Open PowerShell
3. Connect to M365:
```powershell
Connect-MgGraph -Scopes "User.ReadWrite.All","Directory.ReadWrite.All","Group.ReadWrite.All"
