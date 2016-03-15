#!/bin/bash

if ! [ $# -ge 1 ]; then
  echo "$0: Please specify the prefix of the index(es) to snaphost. Ex. logstash"
  exit 1
fi


ES_HOST=${ES_HOST}
WAIT_FOR_COMPLETION="true"
SNAPSHOT_REPO=${SNAPSHOT_REPO}

INDICIES=("$@")

for i in ${INDICIES[@]}; do
  curator --host ${ES_HOST} snapshot --wait_for_completion ${WAIT_FOR_COMPLETION} --name ${i}-$(date +%Y.%m.%d.%s) --repository ${SNAPSHOT_REPO} indices --prefix ${i}
done

exit 0
