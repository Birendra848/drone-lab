#!/usr/bin/env python3

import rclpy
from rclpy.node import Node
from sensor_msgs.msg import Image
import cv2
from cv_bridge import CvBridge


class CameraViewer(Node):

    def __init__(self):
        super().__init__("camera_viewer")

        self.get_logger().info("Camera Viewer node started")

        self.subscription = self.create_subscription(
    Image,
    "/world/runway_world/model/iris_with_gimbal/model/gimbal/link/pitch_link/sensor/camera/image",
    self.image_callback,10)

        self.bridge = CvBridge()

    def image_callback(self, msg):
        frame = self.bridge.imgmsg_to_cv2(
        msg,
        desired_encoding="bgr8")
        cv2.imshow("Drone Camera", frame)
        cv2.waitKey(1)



def main(args=None):

    rclpy.init(args=args)

    node = CameraViewer()

    rclpy.spin(node)

    node.destroy_node()

    cv2.destroyAllWindows()

    rclpy.shutdown()


if __name__ == "__main__":
    main()
