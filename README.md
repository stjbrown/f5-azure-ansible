# f5-azure-ansible

This project was created to allow an F5 Azure Stack to be easily built using [F5's ARM Templates](https://github.com/F5Networks/f5-azure-arm-templates) & Ansible. 
We have choosen to deploy Ansible on top of the [F5 SuperNetops  container](https://github.com/f5devcentral/f5-super-netops-container) for demonstration purposes.

The steps below will  help boot strap the requirements and playbooks.

### Deploy the SNOPS Container

`docker run -p 8080:80 -p 2222:22 -it -e SNOPS_AUTOCLONE=0 f5devcentral/f5-super-netops-container:base`

### Clone the Repo & Install Required tools

```
cd ~
git clone https://github.com/stjbrown/f5-azure-ansible.git
cd f5-azure-ansible/
source start
```
### Configure Service Principle for use by Azure

Follow the link below for a step by step on how to create a new servcice principle

[Create Azure Service Principle](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)

Document the variables below and export them in the container

export AZURE_TENANT=
export AZURE_CLIENT_ID=
export AZURE_SECRET=
export AZURE_SUBSCRIPTION_ID=


### Deploy 3nic Cluster - PAYG 

In order to deploy with Ansible you must first manually deploy the specific image (Good, Better, Best) and Speed (20M, 200M 1G) 1 time. 
After initializing  you can move onto running the playbook.

[Azure ARM Template](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FF5Networks%2Ff5-azure-arm-templates%2Fv4.0.0.0%2Fsupported%2Fcluster%2F3nic%2Fnew_stack%2FPAYG%2Fazuredeploy.json)

#### Choose the required Role

```
vi ~/f5-azure-ansible/site.yml 
```

Comment/Un-Comment to choose the role you wish to deploy.

### Next edit the var


```
vi ~/f5-azure-anible/roles/{{choosen role}}/vars/main.yml 

```
##### or specify them at run time by using --extra-vars 



#### Run the playbook 

```
ansible-playbook ~/f5-azure-ansible/site.yml -vvvv
```

