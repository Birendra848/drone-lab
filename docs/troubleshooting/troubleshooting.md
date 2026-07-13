Issue:
------
SITL reports "link1 down" when launched before Gazebo physics starts.

Cause:
------
Gazebo world loads in a paused state.
The ArduPilot Gazebo plugin begins publishing sensor data only after physics is running.

Current Workaround:
-------------------
1. Launch Gazebo.
2. Press ▶ Play.
3. Launch SITL.

Status:
-------
Under investigation. Determine whether Gazebo or the official ArduPilot plugin supports starting unpaused.
