#!/usr/bin/env python3

import time

import cv2
from cv_bridge import CvBridge

import rclpy
from rclpy.node import Node

from sensor_msgs.msg import Image


CAMERA_TOPIC = (
    "/world/runway_world/model/iris_with_gimbal/model/"
    "gimbal/link/pitch_link/sensor/camera/image"
)


class CameraSubscriber(Node):

    def __init__(self):
        super().__init__("camera_subscriber")

        self.bridge = CvBridge()

        self.subscription = self.create_subscription(
            Image,
            CAMERA_TOPIC,
            self.image_callback,
            10,
        )

        self.last_time = time.time()
        self.frame_count = 0
        self.fps = 0.0

        self.get_logger().info("Camera Subscriber Started")

    def image_callback(self, msg):

        frame = self.bridge.imgmsg_to_cv2(msg, desired_encoding="bgr8")

        self.frame_count += 1

        current = time.time()

        if current - self.last_time >= 1.0:
            self.fps = self.frame_count / (current - self.last_time)
            self.frame_count = 0
            self.last_time = current

        cv2.putText(
            frame,
            f"FPS : {self.fps:.1f}",
            (20, 35),
            cv2.FONT_HERSHEY_SIMPLEX,
            1,
            (0, 255, 0),
            2,
        )

        h, w = frame.shape[:2]

        cv2.putText(
            frame,
            f"{w} x {h}",
            (20, 75),
            cv2.FONT_HERSHEY_SIMPLEX,
            0.8,
            (255, 0, 0),
            2,
        )

        cv2.imshow("Drone Camera", frame)

        if cv2.waitKey(1) == ord("q"):
            rclpy.shutdown()

    def destroy_node(self):
        cv2.destroyAllWindows()
        super().destroy_node()


def main(args=None):

    rclpy.init(args=args)

    node = CameraSubscriber()

    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass

    node.destroy_node()

    rclpy.shutdown()


if __name__ == "__main__":
    main()