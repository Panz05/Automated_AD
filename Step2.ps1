### Install & Configure IIS ###
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

### Install Windows Domain Services & Add New Domain ###
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

Install-ADDSForest -DomainName bubbles.mylab.ad
