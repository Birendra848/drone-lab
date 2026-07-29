#!/usr/bin/env bash

source "$HOME/drone-lab/scripts/bootstrap/setup_env.sh"

exec gz sim -r \
"$DRONELAB_ROOT/simulation/worlds/ship_landing.sdf"