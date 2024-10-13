# Start with an official ROS Humble image
FROM osrf/ros:humble-desktop

# Install Python and pip
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-dev

# Install vrx_gz dependencies
RUN apt-get update && apt-get install -y \
    ros-humble-vrx-gz

# Install Ultralytics YOLOv11 and other Python dependencies
COPY requirements.txt /app/requirements.txt
RUN pip3 install --upgrade pip \
    && pip3 install -r /app/requirements.txt

# Set up ROS entrypoint
COPY ./ros_entrypoint.sh /
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]