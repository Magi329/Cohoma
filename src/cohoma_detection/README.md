# cohoma_detectiton

## General informations

Mainly modified on qrc_detect

## Nodes

### qrc_detect

qrc_detect is using the pyZbar (https://pypi.org/project/pyzbar/) python library that implements function to automaticly detect a QR code or a bar code on an image. This node contains also some parsing to fit the informations extracted from the QR code to a specific ros message: StrategicPoint (qrc_data).



## Install

First you have to check is you have the GeographicLib library installed.
If not, you can install it from sources with the tutorial on the website: https://geographiclib.sourceforge.io/C++/doc/install.html using the "Installation using the autoconfigure tools"

Then you can clone the projet with the command:
```bash
git clone https://gitlab.ensta.fr/yver/cohoma_detection.git -b master
```
Second, get zbat installed also

## How to use



During the development phases, you can use the img_pub node to publish a photo that contains a qrcode:

```bash
rosrun cohoma_detection img_pub.py 
```

Then launch the qrcode detector to get the relative position (repère de la caméra) and information of the trap

```bash
rosrun cohoma_detection qrc_detect
```