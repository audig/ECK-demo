#!/bin/bash

#Copyright CHATGPT
#Ecris moi un script bash qui attend qu'un Objet Kubernetes elasticsearch soit en health yellow ou green

# Set the name of the Elasticsearch object as an argument
elasticsearch_name=$1

# Set a timeout in seconds
timeout=300

echo "Waiting for Elasticsearch $elasticsearch_name to be in health yellow or green..."

# Set the start time
start_time=$(date +%s)

# Set a flag to indicate whether the Elasticsearch object is in health yellow or green
elasticsearch_healthy=false

# Check for the Elasticsearch object every second until it is healthy or the timeout is reached
while [[ "$elasticsearch_healthy" = false ]] && [[ $(( $(date +%s) - start_time )) -lt $timeout ]]; do
  # Get the health status of the Elasticsearch object
  health=$(kubectl get elasticsearch $elasticsearch_name -o jsonpath='{.status.health}')
  # Check if the health status is yellow or green
  if [[ "$health" = "yellow" ]] || [[ "$health" = "green" ]]; then
    # Set the flag to indicate that the Elasticsearch object is healthy
    elasticsearch_healthy=true
  fi
  # Sleep for 1 second before checking again
  sleep 1
done

# Check if the Elasticsearch object is healthy
if [[ "$elasticsearch_healthy" = true ]]; then
  echo "Elasticsearch $elasticsearch_name is in $health."
else
  echo "Timeout reached. Elasticsearch $elasticsearch_name is not in health yellow or green."
fi
