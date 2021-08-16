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

echo_and_run cd "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_acq_right/src/cv_bridge"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/workspace/stereo_playground/stereo_synthPOC/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/workspace/stereo_playground/stereo_synthPOC/install/lib/python2.7/dist-packages:/workspace/stereo_playground/stereo_synthPOC/build/cv_bridge/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/workspace/stereo_playground/stereo_synthPOC/build/cv_bridge" \
    "/usr/bin/python2" \
    "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_acq_right/src/cv_bridge/setup.py" \
     \
    build --build-base "/workspace/stereo_playground/stereo_synthPOC/build/cv_bridge" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/workspace/stereo_playground/stereo_synthPOC/install" --install-scripts="/workspace/stereo_playground/stereo_synthPOC/install/bin"
