#!/usr/bin/bash


@test "FileContainsStatus" {
  taskId=3
  fileName=testfile.txt
  run sh ./jenkins/myscript.sh $taskId $fileName
  [ "$status" -eq 0 ] #exit code is 0
  run cat $fileName
  [ "$output" == "false" ]
}
