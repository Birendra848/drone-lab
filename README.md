# 🚁 DroneLab

> A reproducible research platform for autonomous UAV systems.

---

## Overview

**DroneLab** is my personal research and development environment for building, testing, and evaluating autonomous UAV algorithms.

The project is being developed as part of my **M.S. by Research at IIIT Bangalore**, with an initial focus on:

- Vision-Based Autonomous Landing
- UAV Perception
- Computer Vision
- Visual SLAM
- Visual Odometry
- State Estimation
- Sensor Fusion
- ROS 2
- Gazebo
- ArduPilot
- MAVLink

The long-term objective is to build a complete **simulation-first UAV research platform** that can later be transferred to real hardware.

---

# Project Architecture

```text
Ubuntu 24.04 LTS
        │
ROS 2 Jazzy
        │
Gazebo Harmonic
        │
ArduPilot SITL
        │
MAVLink
        │
Research Modules
        │
Autonomous Landing
```

---

# Repository Structure

```text
drone-lab/
│
├── infrastructure/
├── simulation/
├── research/
├── datasets/
├── experiments/
├── results/
├── papers/
├── docs/
├── configs/
├── scripts/
├── notebooks/
├── tmp/
└── archive/
```

---

# Current Infrastructure

| Component | Status |
|-----------|--------|
| Ubuntu 24.04 LTS | ✅ |
| ROS 2 Jazzy | ✅ |
| Gazebo Harmonic | ✅ |
| ArduPilot SITL | ✅ |
| Official ArduPilot Gazebo Plugin | ✅ |
| MAVProxy | ✅ |

---

# Research Roadmap

## Sprint 1 — Infrastructure
- Development Environment
- ROS 2
- Gazebo
- ArduPilot
- Automation Scripts
- Documentation

---

## Sprint 2 — Simulation Mastery
- ArduPilot Architecture
- Gazebo Architecture
- MAVLink
- Sensors
- Coordinate Frames
- Camera Pipeline
- Plugin Architecture

---

## Sprint 3 — Landing Environment
- Landing Pad
- Fiducial Markers
- Ship Model
- Dynamic Deck
- Sea Motion

---

## Sprint 4 — Vision Pipeline
- Camera Calibration
- Landing Pad Detection
- Pose Estimation
- Object Tracking

---

## Sprint 5 — Autonomous Landing
- Relative Localization
- Guidance
- Landing Controller
- Precision Landing

---

## Sprint 6 — Experiments
- Baseline Implementation
- Proposed Method
- Evaluation
- Metrics
- Ablation Studies

---

## Sprint 7 — Research Publication
- Experimental Validation
- Result Analysis
- Paper Writing
- Conference / Journal Submission

---

# Philosophy

DroneLab follows a **simulation-first** development approach.

The goal is to build a robust and reproducible research platform where every software component is verified independently before integration.

Key principles include:

- Reproducibility
- Maintainability
- Documentation-first development
- Modular software architecture
- Official documentation over third-party tutorials
- Simulation before hardware deployment

---

# Technology Stack

- Ubuntu 24.04 LTS
- ROS 2 Jazzy
- Gazebo Harmonic
- ArduPilot
- MAVProxy
- MAVLink
- OpenCV
- Python
- C++
- CUDA (planned)
- Visual SLAM (planned)
- Sensor Fusion (planned)

---

# Repository Status

🚧 **Active Research Project**

This repository is under continuous development as part of my M.S. research.

---

# License

This project is released under the **MIT License**.
