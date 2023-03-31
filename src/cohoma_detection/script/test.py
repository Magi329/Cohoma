#!/usr/bin/env python3

import numpy as np
from math import cos, pi, sin

v1 = np.array([1,2,3])
print(v1)
v1 *= 1

gimbal_rad = (0*pi/180)
v0 = np.array([cos(gimbal_rad)*v1[0] + sin(gimbal_rad)*v1[2],v1[1],-sin(gimbal_rad)*v1[0] + cos(gimbal_rad)*v1[2]])

print(v0)