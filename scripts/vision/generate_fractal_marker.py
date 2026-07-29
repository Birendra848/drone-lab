
import cv2
import numpy as np
from pathlib import Path

OUT = Path.home() / "drone-lab/simulation/models/fractal_marker/materials/textures/fractal_marker.png"

dictionary = cv2.aruco.getPredefinedDictionary(
    cv2.aruco.DICT_4X4_100
)

canvas = np.ones((2000, 2000), dtype=np.uint8) * 255


def draw(marker_id, size, x, y):
    img = cv2.aruco.generateImageMarker(dictionary, marker_id, size)
    canvas[y:y+size, x:x+size] = img


# Outer marker
draw(0, 1800, 100, 100)

# Second level
draw(1, 600, 700, 700)

# Third level
draw(2, 220, 890, 890)

# Fourth level
draw(3, 80, 960, 960)

cv2.imwrite(str(OUT), canvas)

print("Saved:", OUT)