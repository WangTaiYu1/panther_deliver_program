execute_process(COMMAND "/home/jw/panther_deliver_program/noetic_workspace/build/descriptions/UR/universal_robots/ur_kinematics/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/jw/panther_deliver_program/noetic_workspace/build/descriptions/UR/universal_robots/ur_kinematics/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
