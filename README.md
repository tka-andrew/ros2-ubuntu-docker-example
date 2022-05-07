# ROS2-FOXY-UBUNTU-DOCKER_EXAMPLE
This is just a minimal example showing how to run ROS2 Foxy on Docker Container with ubuntu:20.04 as base image. 

If you do not need Ubuntu as base image, you may refer to this [tutorial](https://docs.ros.org/en/foxy/How-To-Guides/Run-2-nodes-in-single-or-separate-docker-containers.html) to use the osrf/ros:foxy-desktop docker image instead.

## RUNNING ON DOCKER CONTAINER

### To build this image
```
./builldDockerImage.sh
```

### Run a turtlesim_node
```
./runDockerFile.sh
ros2 run turtlesim turtlesim_node
```

### Open another terminal to run turtle_teleop_key
```
./runDockerFile.sh
ros2 run turtlesim turtle_teleop_key
```