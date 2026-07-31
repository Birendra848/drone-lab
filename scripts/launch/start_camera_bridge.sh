#!/usr/bin/env bash

source "$HOME/drone-lab/scripts/bootstrap/setup_env.sh"

exec ros2 run ros_gz_bridge parameter_bridge \
"/world/runway_world/model/iris_with_gimbal/model/gimbal/link/pitch_link/sensor/camera/image@sensor_msgs/msg/Image@gz.msgs.Image"
