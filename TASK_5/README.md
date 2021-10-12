## Playbook Execution:

### Checkout git repository
`git clone https://github.com/sekasara/sitecore.git`

### Change Directory to Ansible Playbook
`cd sitecore/TASK_5/ansible`

### Execute Ansible Playbook
`ansible-playbook setup.yaml` / `ansible-playbook setup.yaml --extra-vars <extra_variables>`

Once the playbook executed, it will create ConfigMap and Deployment/StatefulSet Manifest yaml file in current directory  
`cat ./configmap.yaml`  
`cat ./manifest.yaml`
