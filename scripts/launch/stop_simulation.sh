#!/usr/bin/env bash

echo "Stopping DroneLab..."

pkill -f "gz sim"
pkill -f "parameter_bridge"
pkill -f "MAVProxy"
pkill -f "mavproxy.py"
pkill -f "rqt_image_view"
pkill -f "image_tools"
pkill -f "vision_landing"

sleep 2

pkill -f "launch_gazebo.sh"
pkill -f "launch_sitl.sh"
pkill -f "start_camera_bridge.sh"

echo "Done."