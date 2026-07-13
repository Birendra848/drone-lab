#!/usr/bin/env bash

gnome-terminal --title="Gazebo" -- bash -c \
"$HOME/drone-lab/scripts/launch/launch_gazebo.sh; exec bash"

echo "Waiting for Gazebo to initialize..."
sleep 8

gnome-terminal --title="ArduPilot SITL" -- bash -c \
"$HOME/drone-lab/scripts/launch/launch_sitl.sh; exec bash"
