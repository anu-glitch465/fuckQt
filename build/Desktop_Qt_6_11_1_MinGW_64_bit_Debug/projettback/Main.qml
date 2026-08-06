import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic
import QtQuick.Effects
import Qt5Compat.GraphicalEffects


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
Window{
    visible: true
        width: 800
        height: 600

        ShaderEffect {
            anchors.fill: parent

            vertexShader: "qrc:/shaders/fullscreen.vert.qsb"
            fragmentShader: "qrc:/shaders/gradient.frag.qsb"

            property vector2d u_resolution: Qt.vector2d(width, height)
            property real u_time: 0.0
            property vector2d u_mouse: Qt.vector2d(0, 0)
        }
}

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

    Buttoncircle {
        scale: mouse1.containsMouse ? 1.1 : 1.0
        Behavior on scale {NumberAnimation {duration: 150; easing.type: Easing.OutCirc }}

        MouseArea{
        id: mouse1
        anchors.fill: parent
        hoverEnabled: true
        }
        onClicked: {
            console.log("triangle clicked")
        }
    }

    TrianButt{
        id: targetItem
        x: 500
        y:100
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
        color: "#7B8EAB"

        onClicked: {
            console.log("triangle clicked")
        }
    //     Glow {
    //             anchors.fill: targetItem
    //             source: targetItem

    //             radius: 16              // Радиус свечения
    //             color: "#00d2ff"         // Цвет
    //             spread: 0.15            // Плотность у краев (от 0.0 до 1.0)
    //             //fast: true               // Оптимизированный быстрый шейдер
    //         }
    }
    // Image {
    //     width: 120
    //     height: 100
    //     id: name
    //     source: "qrc:/qt/qml/projettback/logo.png"
    // }
    Mybutton{
        id: crug
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

