M365 User Onboarding Automation (PowerShell)
Overview
This project automates Microsoft 365 user onboarding using PowerShell and Microsoft Graph.

It allows IT admins to:

Create new users
Update existing users
Assign licenses
Bulk process users using a CSV file

This simplifies repetitive tasks and makes user management scalable and error-free.
Prerequisites

1. Install Microsoft Graph Modules
   
Install-Module Microsoft.Graph -Scope CurrentUser
Import-Module Microsoft.Graph
Import-Module Microsoft.Graph.Users
Import-Module Microsoft.Graph.Authentication

Check available modules with:
Get-Module -ListAvailable Microsoft.Graph*

Connect to Microsoft 365 

Authenticate your session with Microsoft Graph:
Connect-MgGraph -Scopes "User.ReadWrite.All","Directory.ReadWrite.All"
project structure 
Powershell-onboard/
│
├── OnboardUsersSimple.ps1    # Main onboarding script
├── users.csv                 # User list CSV
└── README.md

Run the Script
cd C:\Users\shash\Powershell-onboard
.\OnboardUsersSimple.ps1

The script will: 

Read the users.csv file.
Create new users or update existing users.
Assign licenses using Set-MgUserLicense.

git init
git add.
git commit -m "Initial commit."
git remote add origin <repo-url>
git push -u origin main


