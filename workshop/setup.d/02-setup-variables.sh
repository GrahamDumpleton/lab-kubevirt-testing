#!/bin/bash

set -x

MASTER_CLUSTER_IP=A.B.C.D
NODE01_CLUSTER_IP=A.B.C.D
NODE02_CLUSTER_IP=A.B.C.D

MASTER_CLUSTER_IP_COMMAND="kubectl get services master -o jsonpath='{.spec.clusterIP}'"
NODE01_CLUSTER_IP_COMMAND="kubectl get services node01 -o jsonpath='{.spec.clusterIP}'"
NODE02_CLUSTER_IP_COMMAND="kubectl get services node02 -o jsonpath='{.spec.clusterIP}'"

STATUS=1; ATTEMPTS=0; until [ $STATUS -eq 0 ] || MASTER_CLUSTER_IP=$($MASTER_CLUSTER_IP_COMMAND) || [ $ATTEMPTS -eq 5 ]; do sleep 5; MASTER_CLUSTER_IP=$($MASTER_CLUSTER_IP_COMMAND); STATUS=$?; ATTEMPTS=$((ATTEMPTS + 1)); done
STATUS=1; ATTEMPTS=0; until [ $STATUS -eq 0 ] || NODE01_CLUSTER_IP=$($NODE01_CLUSTER_IP_COMMAND) || [ $ATTEMPTS -eq 5 ]; do sleep 5; NODE01_CLUSTER_IP=$($NODE01_CLUSTER_IP_COMMAND); STATUS=$?; ATTEMPTS=$((ATTEMPTS + 1)); done
STATUS=1; ATTEMPTS=0; until [ $STATUS -eq 0 ] || NODE02_CLUSTER_IP=$($NODE02_CLUSTER_IP_COMMAND) || [ $ATTEMPTS -eq 5 ]; do sleep 5; NODE02_CLUSTER_IP=$($NODE02_CLUSTER_IP_COMMAND); STATUS=$?; ATTEMPTS=$((ATTEMPTS + 1)); done

cat > /opt/workshop/content/vars.liquid << EOF
{% assign MASTER_CLUSTER_IP = $MASTER_CLUSTER_IP %}
{% assign NODE01_CLUSTER_IP = $NODE01_CLUSTER_IP %}
{% assign NODE02_CLUSTER_IP = $NODE02_CLUSTER_IP %}
EOF
