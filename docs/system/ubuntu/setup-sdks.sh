#!/bin/bash
export SDKMAN_DIR="$HOME/.sdkman" &&
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] &&
sdk install java 8.0.302-open
sdk install java 11.0.11.hs-adpt
sdk install java 12.0.2.hs-adpt
sdk install java 16.0.1.hs-adpt
sdk install java 17.0.4.1-zulu
sdk install java 18.0.2-open
sdk install java 19.0.2-open
sdk install java 20.0.1-open
sdk install java 22.2.r17-grl
