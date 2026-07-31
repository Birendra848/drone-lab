#!/usr/bin/env bash

set -e

DRONELAB="$HOME/drone-lab"

TIMEOUT=30

wait_for_world() {
    echo "[1/4] Waiting for Gazebo world..."

    local waited=0

    until gz topic -l 2>/dev/null | grep -q "/world/runway_world"; do
        sleep 1
        ((waited++))

        if [ "$waited" -ge "$TIMEOUT" ]; then
            echo
            echo "ERROR: Gazebo world failed to start within ${TIMEOUT}s."
            exit 1
        fi
    done

    echo "✓ Gazebo world detected"
}

start_simulation() {

    echo "========================================"
    echo "        DroneLab Launcher"
    echo "========================================"

    echo "[1/4] Starting Gazebo..."

    gnome-terminal --title="Gazebo" -- bash -c \
    "$DRONELAB/scripts/launch/launch_gazebo.sh"

    wait_for_world

    echo
    echo "[2/4] Starting ArduPilot SITL..."

    gnome-terminal --title="ArduPilot SITL" -- bash -c \
    "$DRONELAB/scripts/launch/launch_sitl.sh"

    echo "✓ SITL launched"
}

start_camera_bridges() {

    echo
    echo "[3/4] Starting Camera Bridges..."

    gnome-terminal --title="Camera Bridges" -- bash -c \
    "$DRONELAB/scripts/launch/start_camera_bridge.sh"

    echo "✓ Camera bridges running"
}

start_viewer() {

    echo
    echo "[4/4] Opening Camera Viewer..."

    gnome-terminal --title="Camera Viewer" -- bash -c \
    "ros2 run rqt_image_view rqt_image_view"

    echo "✓ Viewer launched"
}

show_help() {

cat << EOF

DroneLab Launcher

Usage:

./scripts/launch/start_simulation.sh

Options

--bridge
--viewer
--all
--help

EOF

}

case "$1" in

    "")
        start_simulation
        ;;

    --bridge)
        start_simulation
        start_camera_bridges
        ;;

    --viewer|--all)
        start_simulation
        start_camera_bridges
        start_viewer
        ;;

    --help|-h)
        show_help
        ;;

    *)
        echo "Unknown option: $1"
        show_help
        exit 1
        ;;
esac

echo
echo "========================================"
echo "Launcher completed successfully."
echo "========================================"