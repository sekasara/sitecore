## Script Execution:

### Checkout git repository
`git clone https://github.com/sekasara/sitecore.git`

### Change Directory to Terraform Module
`cd sitecore/TASK_2`

### Execute the script:
`bash setup_es.sh`


The script will install docker and runs the elasticsearch service inside docker container.
Once the container started, You may check the status using below command  
`curl -X GET "localhost:9200/_cluster/health"`
