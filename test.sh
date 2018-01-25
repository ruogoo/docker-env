#!/bin/bash -l

FAILED=`docker ps -a | grep -i exit | wc -l`
if [[ $FAILED -gt 0 ]]; then
    echo "Docker up failed."
    exit -1 
else
    echo "Docker up succeeded."
fi
