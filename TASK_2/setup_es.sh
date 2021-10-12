#!/bin/bash

sudo apt-get update

# Remove old version of docker
sudo apt-get remove docker docker-engine docker.io containerd runc -y

# Install common required libraries
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y

# Install latest version of docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg --batch --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io -y


# Run elasticsearch service in docker container
sudo docker run -itd -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.15.0


# Check Elasticsearch health status
echo 'Please wait for a minute to start Elasticsearch and run below command to check health of elasticsearch server'
echo 'curl -X GET "localhost:9200/_cluster/health"'