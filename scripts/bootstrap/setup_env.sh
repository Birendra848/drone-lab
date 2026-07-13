#!/usr/bin/env bash

# =====================================================
# DroneLab Bootstrap Environment
# =====================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export DRONELAB_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# ---------- ROS 2 ----------
if [ -f /opt/ros/jazzy/setup.bash ]; then
    source /opt/ros/jazzy/setup.bash
fi

# ---------- ROS Workspace ----------
if [ -f "$DRONELAB_ROOT/infrastructure/ros2_ws/install/setup.bash" ]; then
    source "$DRONELAB_ROOT/infrastructure/ros2_ws/install/setup.bash"
fi

# ---------- Gazebo ----------
export GZ_SIM_SYSTEM_PLUGIN_PATH="$DRONELAB_ROOT/infrastructure/ardupilot_gazebo/build:${GZ_SIM_SYSTEM_PLUGIN_PATH}"

export GZ_SIM_RESOURCE_PATH="$DRONELAB_ROOT/infrastructure/ardupilot_gazebo/models:$DRONELAB_ROOT/infrastructure/ardupilot_gazebo/worlds:${GZ_SIM_RESOURCE_PATH}"

echo
echo "=========================================="
echo "        DroneLab Environment"
echo "=========================================="
echo "Root          : $DRONELAB_ROOT"
echo "ROS Distro    : ${ROS_DISTRO:-Not Found}"
echo "=========================================="
echo
