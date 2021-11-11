#!/usr/bin/env bash

function getTask(){
    local taskId=$1
    out_response=$(curl -X GET https://jsonplaceholder.typicode.com/todos/"$taskId")
    status=$(echo $out_response | cut -d "," -f4 | awk '{print $2}')
    echo $status
}

function saveOutput(){
  local fileName=$1
  local status=$2
  if [ "$status" != "false" ]; then
    echo "Status of task completion is not true: $status"
    exit 1
  else
    echo "Status of task completion is false: $status"
    echo "$status" > "$fileName"
  fi
}

function run_main(){
  local taskId=$1
  local fileName=$2
  getTask "$taskId"
  saveOutput "$fileName" "$status"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  run_main $1 $2
fi
