#!/bin/bash

# default value is 2 (30ms ?), each tick = 15ms
defaults write NSGlobalDomain KeyRepeat -int 1

# default value is 15 (225ms), each tick = 15ms
defaults write NSGlobalDomain InitialKeyRepeat -int 10
