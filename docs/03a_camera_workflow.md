# Camera Workflow

This document describes the standard workflow for launching the DroneLab simulation, starting the camera bridges, and viewing the camera feeds.

---

# Purpose

After completing this workflow, you should be able to:

- Launch the Gazebo simulation
- Start ArduPilot SITL
- Bridge Gazebo camera topics to ROS 2
- View live camera feeds
- Verify that the camera pipeline is working correctly

This workflow should be completed before starting any computer vision experiments such as ArUco detection or pose estimation.

---

# Prerequisites

Make sure the following are installed and working:

- Ubuntu 24.04 LTS
- ROS 2 Jazzy
- Gazebo Harmonic
- ArduPilot SITL
- DroneLab workspace

---

# Launch Options

Choose **only one** of the following commands.

## Option 1 – Simulation Only

Starts:

- Gazebo
- ArduPilot SITL

Use this when you only want the simulator.

```bash
~/drone-lab/scripts/launch/start_simulation.sh
```

---

## Option 2 – Simulation + Camera Bridges

Starts:

- Gazebo
- SITL
- Camera Bridges

Use this when developing ROS or OpenCV nodes.

```bash
~/drone-lab/scripts/launch/start_simulation.sh --bridge
```

---

## Option 3 – Everything

Starts:

- Gazebo
- SITL
- Camera Bridges
- Image Viewer

Recommended for daily development.

```bash
~/drone-lab/scripts/launch/start_simulation.sh --all
```

---

# Step 1 – Wait for the Simulation

Do not continue immediately.

Wait until all of the following happen:

✅ Gazebo opens

✅ The Ship Landing world loads

✅ The drone appears

✅ MAVProxy console opens

✅ ArduPilot reports it is connected

The simulation should now be running.

---

# Step 2 – Verify Gazebo Camera Topics (Recommended)

## Why?

This confirms that Gazebo is publishing camera images.

If these topics do not exist, the camera itself is not working.

Run:

```bash
gz topic -l | grep image
```

Expected output:

```
/world/iris_runway/model/iris_ship_landing/model/camera_down/link/pitch_link/sensor/camera_down/image

/world/iris_runway/model/iris_ship_landing/model/gimbal/link/pitch_link/sensor/camera/image
```

### Success

Both topics are listed.

Proceed to the next step.

### Failure

If no topics appear:

- Check that Gazebo finished loading.
- Verify that the correct world was launched.
- Verify that the drone model contains both cameras.

Do **not** continue until these topics appear.

---

# Step 3 – Start Camera Bridges

Skip this step if you used:

```bash
start_simulation.sh --bridge
```

or

```bash
start_simulation.sh --all
```

Otherwise run:

```bash
~/drone-lab/scripts/launch/start_camera_bridge.sh
```

The script starts:

- Downward Camera Bridge
- Gimbal Camera Bridge

Leave these terminals open.

---

# Step 4 – Verify ROS Topics (Recommended)

## Why?

The previous step only confirms Gazebo is publishing images.

This step confirms that the ROS-Gazebo bridge is forwarding those images into ROS 2.

Run:

```bash
ros2 topic list | grep image
```

Expected output:

```
/world/iris_runway/model/iris_ship_landing/model/camera_down/link/pitch_link/sensor/camera_down/image

/world/iris_runway/model/iris_ship_landing/model/gimbal/link/pitch_link/sensor/camera/image
```

### Success

Both topics are visible.

The bridge is working correctly.

### Failure

If nothing appears:

- Check that the bridge terminals are still running.
- Look for error messages in the bridge terminals.
- Restart the camera bridge.

---

# Step 5 – Open Image Viewer

Skip this step if you launched:

```bash
start_simulation.sh --all
```

Otherwise run:

```bash
ros2 run rqt_image_view rqt_image_view
```

---

# Step 6 – Select a Camera Topic

When rqt_image_view opens:

Click the topic dropdown.

You should see:

```
/world/iris_runway/model/iris_ship_landing/model/camera_down/link/pitch_link/sensor/camera_down/image
```

and

```
/world/iris_runway/model/iris_ship_landing/model/gimbal/link/pitch_link/sensor/camera/image
```

---

## Downward Camera

Select:

```
/world/iris_runway/model/iris_ship_landing/model/camera_down/link/pitch_link/sensor/camera_down/image
```

Use this camera for:

- ArUco Detection
- Pose Estimation
- Landing Controller
- Autonomous Landing

---

## Gimbal Camera

Select:

```
/world/iris_runway/model/iris_ship_landing/model/gimbal/link/pitch_link/sensor/camera/image
```

Use this camera for:

- General inspection
- Navigation
- Scene visualization

---

# Viewing Both Cameras

Launch a second image viewer.

```bash
ros2 run rqt_image_view rqt_image_view
```

Viewer 1

```
Downward Camera
```

Viewer 2

```
Gimbal Camera
```

---

# Expected Terminal Layout

If using:

```bash
start_simulation.sh --all
```

You should have:

```
Terminal 1
Gazebo
```

```
Terminal 2
ArduPilot SITL
```

```
Terminal 3
Camera Bridges
```

```
Terminal 4
rqt_image_view
```

---

# Shutdown

Close applications in this order:

1. rqt_image_view
2. Camera Bridge
3. Gazebo
4. ArduPilot SITL

---

# Workflow Complete

At this point the camera pipeline is fully operational.

You are ready to begin:

- OpenCV image subscription
- ArUco marker detection
- Pose estimation
- Autonomous landing experiments