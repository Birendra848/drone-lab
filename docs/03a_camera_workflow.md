# Camera Workflow

This document describes the daily workflow for launching the simulation and viewing the camera feeds.

---

# Prerequisites

- ROS 2 Jazzy installed
- Gazebo Harmonic installed
- ArduPilot SITL built
- drone-lab workspace available

---

# Step 1 – Start the Simulation

```bash
~/drone-lab/scripts/launch/start_simulation.sh
```

Wait until:

- Gazebo opens
- Ship world loads
- Drone spawns
- ArduPilot connects
- Simulation starts

---

# Step N – Verify Gazebo Camera Topics (Optional)

```bash
gz topic -l | grep image
```

Expected:

```
/world/iris_runway/model/iris_ship_landing/model/camera_down/link/pitch_link/sensor/camera_down/image

/world/iris_runway/model/iris_ship_landing/model/gimbal/link/pitch_link/sensor/camera/image
```

---

# Step 2 – Start Camera Bridges

Open a new terminal.

```bash
~/drone-lab/scripts/launch/start_camera_bridge.sh
```

The script automatically launches:

- Downward camera bridge
- Gimbal camera bridge

---

# Step 3 – Verify ROS Topics (Optional)

```bash
ros2 topic list | grep image
```

Expected output:

```
/world/iris_runway/model/iris_ship_landing/model/camera_down/link/pitch_link/sensor/camera_down/image

/world/iris_runway/model/iris_ship_landing/model/gimbal/link/pitch_link/sensor/camera/image
```

---

# Step 4 – Open Image Viewer

```bash
ros2 run rqt_image_view rqt_image_view
```

Choose either camera topic from the dropdown.

To view both cameras simultaneously, launch another instance:

```bash
ros2 run rqt_image_view rqt_image_view
```

---

# Step 5 – Verify ROS Topics (Optional)

```bash
ros2 topic list | grep image
```

Expected:

```
/world/iris_runway/model/iris_ship_landing/model/camera_down/link/pitch_link/sensor/camera_down/image

/world/iris_runway/model/iris_ship_landing/model/gimbal/link/pitch_link/sensor/camera/image
```

---

# Step 6 – Open Camera Viewer

```bash
ros2 run rqt_image_view rqt_image_view
```

Select one of the available topics from the dropdown menu.

---

# View Both Cameras

Launch a second viewer.

```bash
ros2 run rqt_image_view rqt_image_view
```

Viewer 1

```
/world/iris_runway/model/iris_ship_landing/model/camera_down/link/pitch_link/sensor/camera_down/image
```

Viewer 2

```
/world/iris_runway/model/iris_ship_landing/model/gimbal/link/pitch_link/sensor/camera/image
```

---

# Terminal Layout

Terminal 1

```
start_simulation.sh
```

Terminal 2

```
camera_down bridge
```

Terminal 3

```
gimbal bridge
```

Terminal 4

```
rqt_image_view
```

Terminal 5 (Optional)

```
second rqt_image_view
```

---

# Shutdown

Close:

- rqt_image_view
- ros_gz_bridge terminals
- Gazebo
- SITL

---

# Notes

Current camera topics:

```
Downward Camera

/world/iris_runway/model/iris_ship_landing/model/camera_down/link/pitch_link/sensor/camera_down/image


Gimbal Camera

/world/iris_runway/model/iris_ship_landing/model/gimbal/link/pitch_link/sensor/camera/image
```

---

# Next Phase

Use the downward camera topic for:

- OpenCV image subscriber
- ArUco detection
- Pose estimation
- Autonomous landing controller

```
# Terminal 1
~/drone-lab/scripts/launch/start_simulation.sh

# Terminal 2
~/drone-lab/scripts/launch/start_camera_bridge.sh

# Terminal 3
ros2 run rqt_image_view rqt_image_view

```
