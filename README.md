# mtt-building-with-bicep

Public repo hosting Microsoft Tech Talks "Building with Bicep" demo files. Session link: https://mtt.eventbuilder.com/event/60562?source=MTTEUROPE

## Authors

- Kevin Evans - GitHub: @kevinevans1 - Twitter: https://twitter.com/thekevinevans
- Jack Tracey - GitHub: @jtracey93 - Twitter: https://twitter.com/Jack_Ref

## Useful Links

- [Bicep Learning Path](https://aka.ms/learnbicep)

## Pre-Reqs

- [Visual Studio Code (VS Code)](https://code.visualstudio.com/)
- [GIT](https://git-scm.com/downloads)
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Azure Subscription
  - Create a free subscription [here](https://azure.microsoft.com/free/)

## Instructions

Follow the below instructions to get hands on with these pre-made demos.

1. Clone this git repo to your local machine
```
git clone https://github.com/kevinevans1/mtt-building-with-bicep
```

## Storage Account Demo

1. Change into the correct directory inside the repo you've cloned

```
cd <PATH TO CLONE REPO>/mtt-building-with-bicep/samples/l200/azure-storage-container
```

2. Login into your Azure subscription

 ```bash
az login
```

3. Select Azure Subscription

```bash
az account set --subscription "Subscription Name"
```

4. Create Resource Group
```bash
   az group create --location "westeurope" \
   --name "Storage-Account-POC"
```

4. Deploy Bicep file and modules

```bash
az deployment group create --resource-group "Storage-Account-POC" --template-file main.bicep
```

## Hub & Spoke

1. Change into the correct directory inside the repo you've cloned

```
cd <PATH TO CLONE REPO>/mtt-building-with-bicep/samples/l300/azure-hub-spoke-vnet
```

2. Login into your Azure subscription

 ```bash
az login
```

3. Select Azure Subscription

```bash
az account set --subscription "Subscription Name"
```

4. Create Resource Group
```bash
   az group create --location "westeurope" \
   --name "Hub-Spoke-POC"
```

4. Deploy Bicep file and modules

```bash
az deployment group create --resource-group "Hub-Spoke-POC" --template-file main.bicep
```
