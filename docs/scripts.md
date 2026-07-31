# Launch Scripts

## start_simulation.sh

Location

```
scripts/launch/start_simulation.sh
```

Purpose

- Starts Gazebo Harmonic
- Starts ArduPilot SITL
- Loads the ship world
- Spawns the research drone

---

## start_camera_bridge.sh

Location

```
scripts/launch/start_camera_bridge.sh
```

Purpose

Starts the ROS-Gazebo bridges for all camera sensors.

Current bridges:

- Downward RGB camera
- Gimbal RGB camera

Usage

```bash
~/drone-lab/scripts/launch/start_camera_bridge.sh
```

After running the script, camera feeds are available as ROS 2 image topics and can be viewed using:

```bash
ros2 run rqt_image_view rqt_image_view
```