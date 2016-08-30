#!/bin/bash

echo $(kwmc query space active tag) | alerter -title Focus -timeout 5
