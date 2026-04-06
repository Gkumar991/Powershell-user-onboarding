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
