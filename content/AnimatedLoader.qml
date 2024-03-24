import QtQuick 6.2
import QtQuick.Timeline

Item {
    id: loader
    width: 3 * rectWidth + 2 * spacing
    height: rectHeight

    property int rectWidth: 12
    property int radius: rectWidth/2
    property int rectHeight: rectWidth
    property int spacing: 8
    property bool animationRunning: false

    function startAnimation() {
        animationRunning = true;
    }

    function stopAnimation() {
        animationRunning = false;
    }

    Rectangle {
        id: ellipse1
        color: "#0760FB"
        x: 0
        width: loader.rectWidth
        height: loader.rectHeight
        radius: loader.radius
    }
    Rectangle {
        id: ellipse2
        color: "#0760FB"
        x: 1 * (loader.rectWidth + loader.spacing)
        width: loader.rectWidth
        height: loader.rectHeight
        radius: loader.radius
    }

    Rectangle {
        id: ellipse3
        color: "#0760FB"
        x: 2 * (loader.rectWidth + loader.spacing)
        width: loader.rectWidth
        height: loader.rectHeight
        radius: loader.radius
    }

    Component.onCompleted: {
        startAnimation();
    }

    Timeline {
        id: timeline1
        animations: [
            TimelineAnimation {
                id: timelineAnimation1
                running: loader.animationRunning
                loops: -1
                duration: 1000
                from: 0
                to: 5000
            }
        ]
        enabled: true
        startFrame: 0
        endFrame: 5000

        KeyframeGroup {
            target: ellipse1
            property: "y"
            Keyframe {
                value: 0
                frame: 0
            }
            Keyframe {
                value: -20
                frame: 1000
            }
            Keyframe {
                value: 0
                frame: 1000 * 2
            }
        }

        KeyframeGroup {
            target: ellipse2
            property: "y"
            Keyframe {
                value: 0
                frame: 1000 * 1
            }
            Keyframe {
                value: -20
                frame: 1000 * 2
            }
            Keyframe {
                value: 0
                frame: 1000 * 3
            }
        }

        KeyframeGroup {
            target: ellipse3
            property: "y"
            Keyframe {
                value: 0
                frame: 1000 * 2
            }
            Keyframe {
                value: -20
                frame: 1000 * 3
            }
            Keyframe {
                value: 0
                frame: 1000 * 4
            }
        }
    }
}
