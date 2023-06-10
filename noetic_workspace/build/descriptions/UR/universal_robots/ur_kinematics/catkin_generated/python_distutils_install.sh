#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/jw/panther_deliver_program/noetic_workspace/src/descriptions/UR/universal_robots/ur_kinematics"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/jw/panther_deliver_program/noetic_workspace/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/jw/panther_deliver_program/noetic_workspace/install/lib/python3/dist-packages:/home/jw/panther_deliver_program/noetic_workspace/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/jw/panther_deliver_program/noetic_workspace/build" \
    "/usr/bin/python3" \
    "/home/jw/panther_deliver_program/noetic_workspace/src/descriptions/UR/universal_robots/ur_kinematics/setup.py" \
     \
    build --build-base "/home/jw/panther_deliver_program/noetic_workspace/build/descriptions/UR/universal_robots/ur_kinematics" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/jw/panther_deliver_program/noetic_workspace/install" --install-scripts="/home/jw/panther_deliver_program/noetic_workspace/install/bin"
