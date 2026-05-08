#!/bin/bash

defaults write com.apple.dock springboard-rows -int $1 && defaults write com.apple.dock springboard-columns -int $2;killall Dock
