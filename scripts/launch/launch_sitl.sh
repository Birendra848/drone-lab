#!/usr/bin/env bash

source ~/venv-ardupilot/bin/activate

source "$HOME/drone-lab/scripts/bootstrap/setup_env.sh"

cd "$DRONELAB_ROOT/infrastructure/ardupilot"

Tools/autotest/sim_vehicle.py \
-v ArduCopter \
--model JSON \
--console \
--map
