#!/bin/bash

SSH_ARGS="-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
SSH_KEY="ezio.pem"
EZIO="../static-ezio"

if [ ! -f "$SSH_KEY" ]; then
	SSH_KEY="tests/$SSH_KEY"
fi

# ssh to ezio.kojuro.date and run script
scp -i $SSH_KEY $SSH_ARGS "$EZIO" "ezio@ezio.kojuro.date:~/"
ssh -i $SSH_KEY $SSH_ARGS "ezio@ezio.kojuro.date" ./test_ezio.sh
