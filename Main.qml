import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic
import QtQuick.Effects


ApplicationWindow {
    id: window
    width: 640
    height: 480
    minimumWidth: 200
    minimumHeight: 250
    visible: true
    title: qsTr("jett")
    property bool lightMode: Application.styleHints.colorScheme === Qt.Light
    property color reallyDark: "#1f1f1f"
    property color dark: "#262626"
    property color reallyLight: "#e7e7e7"
    property color light: "#e0e0e0"

    AnimatedImage{
        id: background
        anchors.fill: parent
         source: "qrc:/qt/qml/projettback/background.gif"
         fillMode: Image.PreserveAspectCrop
         visible: false
    }

    MultiEffect {
        anchors.fill: background
        source: background

        blurEnabled: true
        blur: 0.8
    }

    // Button {
    //     width: 80
    //     height: 80

    //     background: Rectangle {
    //         radius: width / 2
    //         color: "blue"
    //     }

    //     text: "OK"
    // }
    TrianButt{
        width: 100
        height: 100

        scale: mouse.containsMouse ? 1.1 : 1.0

        Behavior on scale {
            NumberAnimation {
                duration: 150
                easing.type: Easing.OutQuad
            }
        }

        MouseArea {
               id: mouse
               anchors.fill: parent
               hoverEnabled: true
           }
        shape: "triangle"
        color: "red"

        onClicked: {
            console.log("triangle clicked")
        }
    }
    Mybutton{
        radius: 20
        color: "blue"
        text:"Truahat"
}

    // GridLayout {
    //     id: grid
    //     columns: width < 400 ? 1 : 2
    //     rowSpacing: 0
    //     columnSpacing: 0
    //     anchors.fill: parent
    // }
}

