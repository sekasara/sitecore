#!/bin/bash

# Fetching using Azure Monitoring

resource_ids=$(terraform output id)

for resource in $(echo ${resource_ids} | sed "s/, ]/ ]/g" | jq ".[]"); do
  file_name=$(echo $resource | sed "s/\(.*\)\/\(.*\)/\2/g" | sed "s/\"//g")
  echo "Percentage CPU" > $file_name
  echo $resource | xargs az monitor metrics list --metric "Percentage CPU" --resource >> $file_name
  echo "Network In Total" >> $file_name
  echo $resource | xargs az monitor metrics list --metric "Network In Total" --resource >> $file_name
  echo "Network Out Total" >> $file_name
  echo $resource | xargs az monitor metrics list --metric "Network Out Total" --resource >> $file_name
done