# REFERENCE: https://devanshdhrafani.github.io/blog/2021/04/15/dockerros2.html

FROM ubuntu:20.04

# Needed for Ubuntu installation
ENV DEBIAN_FRONTEND=noninteractive 
ENV TZ=Etc/UTC

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt update && apt install -y git curl gnupg2 lsb-release
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y ros-foxy-desktop
RUN DEBIAN_FRONTEND=noninteractive apt install -y ros-foxy-turtlesim

WORKDIR /root/dev_ws/src
RUN git clone https://github.com/ros/ros_tutorials.git -b foxy-devel
WORKDIR /root/dev_ws

RUN apt-get install python3-rosdep -y
RUN rosdep init
RUN rosdep update
RUN rosdep install -i --from-path src --rosdistro foxy -y
RUN apt install python3-colcon-common-extensions -y

COPY ros2foxy_entrypoint.sh /root/.
# REFERENCE: https://nickjanetakis.com/blog/docker-tip-86-always-make-your-entrypoint-scripts-executable
RUN chmod +x /root/ros2foxy_entrypoint.sh
ENTRYPOINT ["/root/ros2foxy_entrypoint.sh"]
CMD ["bash"]