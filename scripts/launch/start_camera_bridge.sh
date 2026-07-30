#!/bin/bash

echo "======================================"
echo "Starting Gazebo → ROS2 Camera Bridges"
echo "======================================"

# Downward camera
gnome-terminal -- bash -c "
echo 'Starting Downward Camera Bridge...'
ros2 run ros_gz_bridge parameter_bridge \
/world/iris_runway/model/iris_ship_landing/model/camera_down/link/pitch_link/sensor/camera_down/image@sensor_msgs/msg/Image@gz.msgs.Image
exec bash
"

sleep 2

# Gimbal camera
gnome-terminal -- bash -c "
echo 'Starting Gimbal Camera Bridge...'
ros2 run ros_gz_bridge parameter_bridge \
/world/iris_runway/model/iris_ship_landing/model/gimbal/link/pitch_link/sensor/camera/image@sensor_msgs/msg/Image@gz.msgs.Image
exec bash
"

echo
echo "Camera bridges started."
