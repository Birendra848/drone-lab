# Phase 2 – Camera Pipeline

## Status

✅ Completed

---

# Objective

Attach a downward-facing RGB camera to the research drone, publish the image through Gazebo, bridge it to ROS 2, and verify the live video stream.

---

# Files Modified

## Drone Model

simulation/models/iris_ship_landing/model.sdf

Changes:

- Added `camera_down_rgb` model.
- Attached the camera to `iris_with_standoffs::base_link` using a fixed joint.

---

## Camera Model

simulation/models/camera_down_rgb/model.sdf

Contains:

- RGB Camera Sensor
- Camera geometry
- Camera configuration
- Gazebo camera plugin

---

## World

simulation/worlds/ship_landing.sdf

Updated model:

Before

```
model://iris_with_gimbal
```

After

```
model://iris_ship_landing
```

---

# Launch

Start simulation

```bash
~/drone-lab/scripts/launch/start_simulation.sh
```

---

# Verify Gazebo Camera

```bash
gz topic -l | grep image
```

Output

```
/world/iris_runway/model/iris_ship_landing/model/camera_down/link/pitch_link/sensor/camera_down/image

/world/iris_runway/model/iris_ship_landing/model/gimbal/link/pitch_link/sensor/camera/image
```

---

# ROS2 Bridge

```bash
ros2 run ros_gz_bridge parameter_bridge \
/world/iris_runway/model/iris_ship_landing/model/camera_down/link/pitch_link/sensor/camera_down/image@sensor_msgs/msg/Image@gz.msgs.Image
```

---

# View Camera Feed

```bash
ros2 run rqt_image_view rqt_image_view
```

Select topic

```
/world/iris_runway/model/iris_ship_landing/model/camera_down/link/pitch_link/sensor/camera_down/image
```

---

# Verification

Successfully verified:

- Drone model loads correctly.
- Downward RGB camera attached.
- Gazebo publishes image topic.
- ROS2 bridge receives image.
- rqt_image_view displays live video.

---

# Current Architecture

```
Gazebo Camera
        │
        ▼
Gazebo Transport Topic
        │
        ▼
ros_gz_bridge
        │
        ▼
ROS2 sensor_msgs/Image
        │
        ▼
rqt_image_view
```

---

# Next Phase

Phase 3 – ArUco Marker Detection

Pipeline

```
ROS Image
    │
    ▼
OpenCV
    │
    ▼
ArUco Detection
    │
    ▼
Corner Extraction
    │
    ▼
Pose Estimation
```
---

# Camera Bridge Automation

To avoid manually starting each camera bridge, use the helper script:

```bash
~/drone-lab/scripts/launch/start_camera_bridge.sh
```

The script automatically launches two ROS-Gazebo bridges:

- Downward RGB camera
- Gimbal RGB camera

This replaces the need to manually execute two `ros2 run ros_gz_bridge parameter_bridge ...` commands every session.