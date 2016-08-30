#!/bin/bash

echo $(date +"%a %d %b") | alerter -title Date -timeout 5
