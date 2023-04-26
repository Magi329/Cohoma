# cohoma_detectiton

General information。

This is the computer vison ROS package used for the CoHoMa competion.

It contains two computer visions nodes which are:

* the detection and translation of QR code (qrc_detect.cpp)
* the detection of elements corresponding to a colorimetric invariant (trap_detector.cpp)

These two software bricks subscribe to a video stream and outputs the position of the detected elements.

The information returned by these two nodes are then sorted and concatenated into a single message by another node (qrc_manager.cpp). This message will then be collected by the human machine interface (Mirador) to display them on a map.


## Nodes

### qrc_detect

qrc_detect is using the pyZbar (https://pypi.org/project/pyzbar/) python library that implements function to automaticly detect a QR code or a bar code on an image. This node contains also some parsing to fit the informations extracted from the QR code to a specific ros message: StrategicPoint (qrc_data).

### trap_detector

trap_detector uses open CV functions to identify points of interest (poi) corresponding to a colorimetric invariant whose thresholds have been defined before (in detect.launch). This node also returns a StrategicPoint message (poi_data)

### qrc_manger

qrc_manger subscribes to the strategic point messages of the two nodes above, sorts them to avoid duplicates and concatenates them into a single message sent to the human machine interface

### img_pub

img_pub is a node used for development that allows to publish a video stream from a usb camera

## Install

First you have to check is you have the GeographicLib library installed.
If not, you can install it from sources with the tutorial on the website: https://geographiclib.sourceforge.io/C++/doc/install.html using the "Installation using the autoconfigure tools"

Then you can clone the projet with the command:
```bash
git clone https://github.com/Magi329/Cohoma.git
```

## How to use

Once the node has been cloned and compiled, you can change the topic names used and the HSV detection thresholds in the launchfile:
cohoma_detection/launch/detect.launch

Once the parameters are set, the node can be launched with the command:

```bash
roslaunch cohoma_detection detect.launch 
```

During the development phases, you can use the img_pub node to publish a video stream:

```bash
rosrun cohoma_detection img_pub.py 
```
