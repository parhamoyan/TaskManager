import QtQuick 6.2
import QtQuick.Controls
import TaskManager

Window {
    id: window
    width: 400
    height: 800
    visible: true
    title: "TaskManager"
    flags: Qt.Window | Qt.FramelessWindowHint
    color: "transparent"
    x: Screen.width - width - 10
    y: 60

    Rectangle {
        id: innerRect
        height: 400
        width: 400
        radius: 10
        anchors.centerIn: parent
        state: "loading"

        Behavior on height {
            PropertyAnimation {
                duration: 400
                easing.type: Easing.InOutQuad
            }
        }

        states: [
            State {
                name: "loading"
                PropertyChanges {
                    target: innerRect
                    height: 400
                }
            },
            State {
                name: "loaded"
                PropertyChanges {
                    target: innerRect
                    height: 800
                }
            }
        ]

        StackView {
            id: stack
            initialItem: firstPage
            anchors.fill: parent

            pushEnter: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 200
                }
            }
            pushExit: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 1
                    to:0
                    duration: 200
                }
            }
            popEnter: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 0
                    to:1
                    duration: 200
                }
            }
            popExit: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 200
                }
            }
        }

        Component {
            id: firstPage
            Item {
                AnimatedLoader {
                    anchors.centerIn: parent
                }
            }
        }

        Component {
            id: secondPage
            Rectangle {
                color: "white"
                radius: 10
            }
        }
    }

    Timer {
        id: singleShotTimer
        interval: 3000
        repeat: false
        running: true
        onTriggered: {
            stack.pop();
            stack.push(secondPage);
            innerRect.state = "loaded";
        }
    }
}
