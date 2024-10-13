#!/bin/bash
set -e

# Source ROS setup script
source "/opt/ros/humble/setup.bash"

# Execute the command passed as arguments
exec "$@"