#!/bin/bash

seconds0=$(date +"%s")
while wait;do echo -n .;sleep 1 ; done &
sleep 6
kill $!; trap 'kill $!' SIGTERM
seconds1=$(date +"%s")
echo !$((seconds1 - seconds0))  seconds 