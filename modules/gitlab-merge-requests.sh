#!/bin/bash

# Set your GitLab personal access token here
token="BzVx8xLWvyZW-VESi-RA"

# Set the GitLab project ID here (you can find this in the project's settings)
project_id="moba-developers%2Fhigh-capacity-projects%2Fmagna"

# Set the API endpoint for merge requests for this project
api_endpoint="https://gitlab.moba.net/api/v4/projects/$project_id/merge_requests?state=opened"

# Use curl to retrieve the merge requests for this project
response=$(curl --header "PRIVATE-TOKEN: $token" --silent "$api_endpoint")

# Parse the response to count the number of open merge requests
merge_requests=$(echo "$response" | jq '. | length')

# Output the number of open merge requests to Polybar
echo " $merge_requests"

